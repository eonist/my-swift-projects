import Cocoa
/**
 * set needsDisplay = true to clear the graphics
 * TODO: Write an example
 * NOTE: Example is in the Graphics class
 */
class Graphic:FlippedView{
    var fillShape:CALayer = CALayer()
    var lineShape:CALayer = CALayer()
    var fillStyle:IFillStyle?;
    var lineStyle:ILineStyle?;
    var lineOffsetType:OffsetType?;
    
    
    lazy var graphics: Graphics = Graphics()//Delays the creation of graphics until it is needed, keep in mind that you cant create this instance before drawRect is called
    var path:CGMutablePath = CGPathCreateMutable()
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        
        //continue here, create the CALAyer class, should hold a path and the graphics instance
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}/*Required by super class*/
        
    
    /**
     *
     */
    /*
    override func drawRect(dirtyRect: NSRect) {
    Swift.print("Graphic.drawRect() ")
    super.drawRect(dirtyRect)
    }
    */
}
extension CGMutablePath{
    /**
     * Note its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method
     */
    func add(path:CGPath){
        CGPathAddPath(self, nil, path)
    }
}