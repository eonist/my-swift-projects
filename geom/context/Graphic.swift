import Cocoa
import QuartzCore
/**
 * TODO: Write an example
 * NOTE: Example is in the Graphics class
 * NOTE: you can set the position by calling: graphic.frame.origin = CGPoint()
 * IMPORTANT: You need to set the size of the frame to something, or else the graphics will be clipped. You can get a rect for For Paths and lines by using the native boundingbox methods or custom boundingbox methods
 */
class Graphic:FlippedView,IGraphic{
    lazy var fillShape:Shape = Shape()//TODO:Graphic.init(): dont use lazy, they could be the problem to alot of things, casting problems etc
    lazy var lineShape:Shape = Shape()//{get{return fillShape}set{fillShape = newValue}}/*Shape()*/
    var fillStyle:IFillStyle? //{get{return fillShape.fillStyle}set{fillShape.fillStyle = newValue}}
    var lineStyle:ILineStyle?
    var lineOffsetType:OffsetType;
    var selector: ((layer: CALayer, ctx:CGContext) -> ())?/*this holds any method assigned to it that has its type signature*/
    //override var wantsDefaultClipping:Bool{return false}//avoids clipping the view, not needed when you use layer-hosted
    //override var wantsUpdateLayer:Bool {return true}
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()){
        //Swift.print("Graphic.init()")
        self.fillStyle = fillStyle
        //self.fillShape = FillShape(fillStyle)
        self.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
        super.init(frame:NSRect(0,0,0/*<- was 1*/,0/*<- was 1*/))//<---move this into the arguments/*the width and the height arent clipped*/
        //layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay//this is new, but apple recomends it, more about it here: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW4
        wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        layer = CALayer()//TempCALayer(layer: layer!)
        layer!.masksToBounds = false//this is needed!!!
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        self.fillShape.delegate = self/*this is needed in order to be able to retrive the context and use it whithin the decoratable methods, or else the context would reside isolated inside the Graphic.fillShape, and Graphic.lineShape*/
        self.lineShape.delegate = self
        //self.setDelegate(self)
    }
    /*override func mouseDown(theEvent: NSEvent) {
    Swift.print("Graphic.down")
    //super.mouseDown(theEvent)
    }
    override func hitTest(aPoint: NSPoint) -> NSView? {
    return self//hitTest(aPoint)
    }*/
    /**
     * This is a delegate handler method
     * NOTE: using the other delegate method "displayLayer" does not provide the context to work with. Trying to get context other ways also fail. This is the only method that works with layer contexts
     * NOTE: this is a delegate method for the shapes in Graphic
     */
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        //Swift.print("Graphic.drawLayer(layer,inContext)")
        selector!(layer: layer,ctx: ctx)/*call the selector*/
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}/*Required by super class*/
}
extension Graphic{
    /**
     * NOTE: Convenience method
     */
    /*
    func setDelegate(delegate:AnyObject){
        self.fillShape.delegate = delegate
        self.lineShape.delegate = delegate
    }
     */
    /**
     * Convenince implicit setter
     */
    func setProperties(fillStyle:IFillStyle? = nil, lineStyle:ILineStyle? = nil){// :TODO: remove this and replace with setLineStyle and setFillStyle ?
        //self.fillShape.fillStyle = fillStyle;
        self.fillStyle = fillStyle;
        self.lineStyle = lineStyle;
    }
}
