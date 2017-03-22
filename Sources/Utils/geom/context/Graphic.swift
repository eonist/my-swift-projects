import Cocoa
import QuartzCore
/**
 * IMPORTANT: You need to set the size of the frame to something, or else the graphics will be clipped. You can get a rect for For Paths and lines by using the native boundingbox methods or custom boundingbox methods
 * NOTE: Example is in the Graphics class
 * NOTE: you can set the position by calling: graphic.frame.origin = CGPoint()
 * NOTE: We extend CALayerDelegate so that we can get back draw(_ layer, ctx) without resorting to use MTKView, as MTKView doesn't seem to work as a CALAyerDelegate with CALayer out of the box, because we probably need to use CAMetalLayer...and other complexities conserning MetalKit
 * NOTE: MetalKit is complicated and not easy to use out of the box. Maybe add it as an experimental branch instead, and experiment with it along side Element
 * TODO: Write an example
 */
class Graphic:InteractiveView2,IGraphic,CALayerDelegate{//swift 3 update, NSView doesn't implement CALayerDelegate anymore so you have to implement it your self
    //let delegate = LayerDelegate()
    lazy var fillShape:Shape = Shape()//TODO:Graphic.init(): dont use lazy, they could be the problem to alot of things, casting problems etc
    lazy var lineShape:Shape = Shape()//{get{return fillShape}set{fillShape = newValue}}/*Shape()*/
    var fillStyle:IFillStyle? //{get{return fillShape.fillStyle}set{fillShape.fillStyle = newValue}}
    var lineStyle:ILineStyle?
    var lineOffsetType:OffsetType
    //the bellow line was upgraded to swift 3
    var selector: ((_ layer:CALayer, _ ctx:CGContext) -> ())?/*this holds any method assigned to it that has it's type signature*/
    var trackingArea:NSTrackingArea?
    //override var wantsDefaultClipping:Bool{return false}//avoids clipping the view, not needed when you use layer-hosted
    //override var wantsUpdateLayer:Bool {return true}
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()){
        //Swift.print("Graphic.init()")
        self.fillStyle = fillStyle
        //self.fillShape = FillShape(fillStyle)
        self.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
        super.init(frame:NSRect())
        //layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay//this is new, but apple recomends it, more about it here: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW4
        //wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        //layer = CALayer()//TempCALayer(layer: layer!)
        //layer!.masksToBounds = false//this is needed!!!
        
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        
        self.fillShape.delegate = self/*this is needed in order to be able to retrive the context and use it whithin the decoratable methods, or else the context would reside isolated inside the Graphic.fillShape, and Graphic.lineShape*/
        self.lineShape.delegate = self
        //self.setDelegate(self)
    }
    /**
     * Stops implicit animation from happening
     * NOTE: Remember to set the delegate of your CALayer instance to an instance of a class that at least extends NSObject. In this example we extend NSView.
     * NOTE: this is a delegate method for the shapes in Graphic
     * NOTE: this method is also called on every frame of the animation it seems
     * NOTE: since swift 3, MTKView now implements actionForLayer, not NSView it self (MTKView extends NSView) MTKView is Metal
     */
    func action(for layer: CALayer, forKey event: String) -> CAAction? {//<---this method is probably not needed
        //Swift.print("actionForLayer layer: " + "\(layer)" + " event: " + "\(event)")
        return NSNull()//super.actionForLayer(layer, forKey: event)//
    }
    /**
     * This is the last NSView so we dont forward the hitTest to further descendants, however we could forward the hit test one more step to the CALayer
     * TODO: the logic inside this method should be in the Shape, and this method should just forward to the shape
     */
    override func hitTest(_ aPoint:NSPoint) -> NSView? {
        //Swift.print("hitTest in graphic" + "\(aPoint)")
        //you have to convert the aPoint to localspace
        var localPoint = localPos()//convertPoint(aPoint, fromView: self.window?.contentView)//convertPoint(winMousePos, fromView: nil)//
        //Swift.print("localPoint: " + "\(localPoint)")
        localPoint -= fillShape.frame.origin//<--quick fix, when margin or offset is applied, they act on the frame not the path. They shouldnt but they do so this is a quick fix. Resolve this later and do it better
        let isPointInside:Bool = fillShape.path.contains(localPoint)//swift 3 upgrade was->, a different contains method is used now may cause error//CGPathContainsPoint
        //Swift.print("isPointInside: " + "\(isPointInside)")
        return isPointInside ? self : super.hitTest(aPoint)/*return nil will tell the parent that there was no hit on this view*/
    }
    /**
     * This is a delegate handler method
     * NOTE: using the other delegate method "displayLayer" does not provide the context to work with. Trying to get context other ways also fail. This is the only method that works with layer contexts
     * NOTE: this is a delegate method for the shapes in Graphic
     */
    func draw(_ layer: CALayer, in ctx:CGContext) {//swift 3 -> this may be the solution: super.layer?.draw(in: context)
        selector!(layer, ctx)/*call the selector*/
        //updateTrackingArea()
    }
    /**
     * NOTE: you should use bounds for the rect but we dont rotate the frame so we dont need to use bounds.
     * NOTE: the only way to update trackingArea is to remove it and add a new one
     * NOTE: we could keep the trackingArea in graphic so its always easy to access, but i dont think it needs to be easily accesible atm.
     * PARAM: owner is the instance that receives the interaction event
     */
    override func updateTrackingAreas() {//TODO:you dont have to store the trackingarea in this class you can get and set the trackingarea from NSView
        //Swift.print("updateTrackingArea: " + "\(fillShape.frame)")
        //Swift.print("\(NSViewParser.parents(self))" + ".updateTrackingArea: " + "\(fillShape.frame)")
        if(trackingArea != nil) {self.removeTrackingArea(trackingArea!)}//remove old trackingArea if it exists
        trackingArea = NSTrackingArea(rect: fillShape.frame, options: [NSTrackingAreaOptions.activeAlways, NSTrackingAreaOptions.mouseMoved,NSTrackingAreaOptions.mouseEnteredAndExited], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea!)//<---this will be in the Skin class in the future and the owner will be set to Element to get interactive events etc
        super.updateTrackingAreas()
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
extension Graphic{
    /**
     * Convenince implicit setter
     */
    func setProperties(fillStyle:IFillStyle? = nil, lineStyle:ILineStyle? = nil){// :TODO: remove this and replace with setLineStyle and setFillStyle ?
        //self.fillShape.fillStyle = fillStyle;
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
    }
}
