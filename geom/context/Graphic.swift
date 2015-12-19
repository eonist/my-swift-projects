import Cocoa
import QuartzCore
/**
 * set needsDisplay = true to clear the graphics
 * TODO: Write an example
 * NOTE: Example is in the Graphics class
 */
class Temp:CALayer{
    override func drawInContext(ctx: CGContext) {
        Swift.print("Temp.drawInContext()")
    }
}
class Graphic:FlippedView,IGraphic{
    var fillShape:FillShape = FillShape()
    var lineShape:LineShape = LineShape()//{get{return fillShape}set{fillShape = newValue}}/*Shape()*/
    var fillStyle:IFillStyle? {get{return fillShape.fillStyle}set{fillShape.fillStyle = newValue}}
    var lineStyle:ILineStyle? {get{return lineShape.lineStyle}set{lineShape.lineStyle = newValue}}
    var lineOffsetType:OffsetType;
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var wantsUpdateLayer:Bool {return true}
    init(_ fillStyle:IFillStyle? = nil, _ lineStyle:ILineStyle? = nil, _ lineOffsetType:OffsetType = OffsetType()){
        //Swift.print("Graphic.init()")
        fillShape.fillStyle = fillStyle
        lineShape.lineStyle = lineStyle
        self.lineOffsetType = lineOffsetType
        super.init(frame:NSRect(0,0,1,1))//<---move this into the arguments/*the width and the height arent clipped*/
        layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay//this is new, but apple recomends it, more about it here: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/SettingUpLayerObjects/SettingUpLayerObjects.html#//apple_ref/doc/uid/TP40004514-CH13-SW4
        wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        layer = TempCALayer(layer: layer!)
        
        //layer!.frame = NSRect(0,0,1,1)
        layer?.display()
        layer?.needsLayout()
        
        
        let a = Temp()
        a.frame = NSRect(0,0,100,100)
        //layer?.addSublayer(a)
        a.delegate = self
        a.display()
        //continue here: try to access the context before the displaycall or else you need to implement a first in last out array that stores all the calls to graphics.
        //or look inside the CALayer class, is there a context caller or similar. research this.
        //what about that delegate method maybe?
        //look into why CAShapeLayer exists
        
        
        //let a = TempCALayer()
        //a.frame = NSRect(0,0,100,100)
        //layer?.addSublayer(a)
        /*
        */        //a.display()
        
        layer!.masksToBounds = false//this is needed!!!
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        //layer?.frame = NSRect(0,0,0,0)
        /*
        let layerA = CALayer()
        //layerA.bounds = CGRectMake(0, 0, 100, 100);//this doesnt matter
        layerA.frame = CGRectMake(20, 20, 300, 300);
        layerA.masksToBounds = false//finally it works
        //layerA.position = CGPointMake(10, 10);
        layerA.backgroundColor = NSColor.greenColor().CGColor
        layer!.addSublayer(layerA)
        */
        //layer?.masksToBounds = false
        
        /*
        layer?.addSublayer(lineShape)
        lineShape.masksToBounds = false
        */
        
        /*
        let layerD = CustomLayer(NSColor.blueColor())
        layerD.frame = CGRect(120,120,50,50);
        layerD.display()
        //layerD.masksToBounds = false
        layer!.addSublayer(layerD)
        */
        
    }
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("Graphic.drawLayer(layer,inContext)")
    }
    /**
    * If you do not implement this method, the layer calls the drawLayer:inContext: method instead.
     * NOTE: you can probably derive the cgcontext from inside this method. by utilizing the graphics.contect etc.
    */
     /*
     override func  displayLayer(layer: CALayer){
     Swift.print("Graphic.displayLayer: " + "\(layer)")
     }
     */
    override func updateLayer(){
        Swift.print("Graphic.updateLayer()")
    }
    override func layout(){
        Swift.print("Graphic.layout()")
    }
    /*
    override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    }
    */
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}/*Required by super class*/
    /**
     *
     */
    /**/
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("Graphic.drawRect() ")
        super.drawRect(dirtyRect)
    }

    
    /**
     * Convenince implicit setter
     */
    func setProperties(fillStyle:IFillStyle? = nil, lineStyle:ILineStyle? = nil){// :TODO: remove this and replace with setLineStyle and setFillStyle ?
        self.fillStyle = fillStyle;
        self.lineStyle = lineStyle;
    }
}
extension CGMutablePath{
    /**
     * Note its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method
     */
    func add(path:CGPath){
        CGPathAddPath(self, nil, path)
    }
    /**
     * Returns a copy of it self
     */
    func copy()->CGMutablePathRef {//possibly return CGMutablePathRef
        return CGPathCreateMutableCopy(self)!
    }
}