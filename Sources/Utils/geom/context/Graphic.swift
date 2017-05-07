import Cocoa
import QuartzCore
/**
 * IMPORTANT: ⚠️️ You need to set the size of the frame to something, or else the graphics will be clipped. You can get a rect for For Paths and lines by using the native boundingbox methods or custom boundingbox methods
 * NOTE: you can set the position by calling: graphic.frame.origin = CGPoint()
 * NOTE: We extend CALayerDelegate so that we can get back draw(_ layer, ctx) without resorting to use MTKView, as MTKView doesn't seem to work as a CALAyerDelegate with CALayer out of the box, because we probably need to use CAMetalLayer...and other complexities conserning MetalKit
 * NOTE: MetalKit is complicated and not easy to use out of the box. Maybe add it as an experimental branch instead, and experiment with it along side Element
 */
class Graphic:InteractiveView2,IGraphic,CALayerDelegate{//swift 3 update, NSView doesn't implement CALayerDelegate anymore so you have to implement it your self
    typealias SelectorCallBack = ((_ layer:CALayer, _ ctx:CGContext) -> ())?
    lazy var fillShape:Shape = Shape()
    lazy var lineShape:Shape = Shape()
    var fillStyle:IFillStyle?
    var lineStyle:ILineStyle?
    var lineOffsetType:OffsetType
    var selector:SelectorCallBack/*⚠️️ IMPORTANT ⚠️️: This holds any method assigned to it that has it's type signature*/
    var trackingArea:NSTrackingArea?
    
    
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()){
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
        super.init(frame:NSRect())
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        self.fillShape.delegate = self/* ⚠️️ IMPORTANT ⚠️️: this is needed in order to be able to retrive the context and use it whithin the decoratable methods, or else the context would reside isolated inside the Graphic.fillShape, and Graphic.lineShape*/
        self.lineShape.delegate = self
        self.layerContentsRedrawPolicy = .onSetNeedsDisplay//= NSViewLayerContentsRedrawOnSetNeedsDisplay
    }
    /**
     * Stops implicit animation from happening
     * NOTE: Remember to set the delegate of your CALayer instance to an instance of a class that at least extends NSObject. In this example we extend NSView.
     * NOTE: this is a delegate method for the shapes in Graphic
     * NOTE: this method is also called on every frame of the animation it seems
     * NOTE: since swift 3, MTKView now implements actionForLayer, not NSView it self (MTKView extends NSView) MTKView is Metal
     */
    func action(for layer: CALayer, forKey event: String) -> CAAction? {//<---this method is probably not needed
        return NSNull()
    }
    /**
     * This is the last NSView so we dont forward the hitTest to further descendants, however we could forward the hit test one more step to the CALayer
     * TODO: the logic inside this method should be in the Shape, and this method should just forward to the shape
     */
    override func hitTest(_ aPoint:NSPoint) -> NSView? {
        var localPoint = localPos()/*you have to convert the aPoint to localspace*/
        localPoint -= fillShape.frame.origin//<--quick fix, when margin or offset is applied, they act on the frame not the path. They shouldn't but they do so this is a quick fix. Resolve this later and do it better, one could argu that moving frame is cheaper than rerendering shape
        let isPointInside:Bool = fillShape.path.contains(localPoint)
        return isPointInside ? self : super.hitTest(aPoint)/*return nil will tell the parent that there was no hit on this view*/
    }
    /**
     * This is a delegate handler method
     * NOTE: using the other delegate method "displayLayer" does not provide the context to work with. Trying to get context other ways also fail. This is the only method that works with layer contexts
     * NOTE: this is a delegate method for the shapes in Graphic
     * 1. You call setDisaplay on the CALAyer
     * 2. it calls draw(...) 
     * 3. since a delegate is attached to the CALAyer the draw(...) calls Graphic.draw(...) 
     * 4. which then calls the attached selector 
     * 5. which calls all the way up to the decorator chain to the last decorator. 
     * 6. Which then calls all the methods for form and apperance 
     * 7. which eventually calls Graphics and finalizes the design.
     */
    func draw(_ layer: CALayer, in ctx:CGContext) {
        selector!(layer, ctx)/*call the selector*/
    }
    /**
     * NOTE: you should use bounds for the rect but we dont rotate the frame so we dont need to use bounds.
     * NOTE: the only way to update trackingArea is to remove it and add a new one
     * NOTE: we could keep the trackingArea in graphic so its always easy to access, but i dont think it needs to be easily accesible atm.
     * PARAM: owner is the instance that receives the interaction event
     * TODO:you don't have to store the trackingarea in this class you can get and set the trackingarea from NSView
     */
    override func updateTrackingAreas() {
        if(trackingArea != nil) {self.removeTrackingArea(trackingArea!)}/*remove old trackingArea if it exists*/
        trackingArea = NSTrackingArea(rect: fillShape.frame, options: [NSTrackingAreaOptions.activeAlways, NSTrackingAreaOptions.mouseMoved,NSTrackingAreaOptions.mouseEnteredAndExited], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea!)//<---this will be in the Skin class in the future and the owner will be set to Element to get interactive events etc
        super.updateTrackingAreas()
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
