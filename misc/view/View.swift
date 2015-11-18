import Foundation

class View :FlippedView{
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view

    override init(frame: NSRect) {
        super.init(frame: frame)
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
