import Foundation
/*
 * set needsDisplay = true to clear the graphics
 */
class Graphic:FlippedView{
    lazy var graphics: Graphics = Graphics()//Delays the creation of graphics until it is needed, keep in mind that you cant create this instance before drawRect is called

    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }
    override func drawRect(dirtyRect: NSRect) {
        graphics = Graphics()
    }
    /*
     * Required by super class
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}