import Cocoa
import QuartzCore
/**
 * TODO: Write an example
 * NOTE: Example is in the Graphics class
 * NOTE: you can set the position by calling: graphic.frame.origin = CGPoint()
 */
class Graphic:FlippedView,IGraphic{
    lazy var fillShape:Shape = Shape()
    lazy var lineShape:Shape = Shape()//{get{return fillShape}set{fillShape = newValue}}/*Shape()*/
    var fillStyle:IFillStyle?
    var lineStyle:ILineStyle?
    var lineOffsetType:OffsetType;
    //override var wantsDefaultClipping:Bool{return false}//avoids clipping the view, not needed when you use layer-hosted
    //override var wantsUpdateLayer:Bool {return true}
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()){
        //Swift.print("Graphic.init()")
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
        super.init(frame:NSRect(0,0,0/*<- was 1*/,0/*<- was 1*/))//<---move this into the arguments/*the width and the height arent clipped*/
        //layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay//this is new, but apple recomends it, more about it here: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW4
        wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        layer = CALayer()//TempCALayer(layer: layer!)
        layer!.masksToBounds = false//this is needed!!!
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}/*Required by super class*/
    /**
     * Convenince implicit setter
     */
    func setProperties(fillStyle:IFillStyle? = nil, lineStyle:ILineStyle? = nil){// :TODO: remove this and replace with setLineStyle and setFillStyle ?
        self.fillStyle = fillStyle;
        self.lineStyle = lineStyle;
    }
}
extension Graphic{
    /**
     * NOTE: Convenience method
     */
    func setDelegate(delegate:AnyObject){
        self.fillShape.delegate = delegate
        self.lineShape.delegate = delegate
    }
}
