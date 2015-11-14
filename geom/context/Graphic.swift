import Foundation
/*
 * set needsDisplay = true to clear the graphics
 */
class Graphic:FlippedView{
    var graphics:Graphics
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    init() {
        graphics = Graphics()
        super.init(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }
    /*
     * Required by super class
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}