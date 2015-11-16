import Foundation
/**
 * set needsDisplay = true to clear the graphics
 */
class Graphic:FlippedView{
    lazy var graphics: Graphics = Graphics()//Delays the creation of graphics until it is needed, keep in mind that you cant create this instance before drawRect is called
    var path:CGMutablePath = CGPathCreateMutable()
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        //self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }
    /**
     * Required by super class
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     *
     */
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("Graphic.drawRect() ")
        super.drawRect(dirtyRect)
    }
}
extension CGMutablePath{
    /**
     *
     */
    func add(path:CGPath){
        CGPathAddPath(self, nil, path)
    }
}