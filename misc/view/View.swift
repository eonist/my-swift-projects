import Cocoa

class View :FlippedView{
    var isInteractive:Bool = true
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame: NSRect) {
        super.init(frame: frame)
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func hitTest(aPoint: NSPoint) -> NSView? {return isInteractive ? self : nil}//Avoids covering the graphic behind when dealing with mouse down events
}
