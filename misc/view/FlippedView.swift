import Cocoa
import Foundation
protocol IView:class{/*the :class enables you to set variables via extension etc*/
    var layer:CALayer?{get}//TODO:remove?
    var bounds:NSRect{get}
    var frame:NSRect{get set}
    func addSubview(aView: NSView)
}
class FlippedView:NSView{
    override var flipped:Bool {return true}/*Organizes your view from top to bottom*/
}
/*class FlippedView2:NSOpenGLView{

override init(frame frameRect: NSRect) {
super.init(frame: frameRect, pixelFormat: NSOpenGLView.defaultPixelFormat())!
}

required init?(coder: NSCoder) {
fatalError("init(coder:) has not been implemented")
}
override var flipped:Bool {return true}/*Organizes your view from top to bottom*/
}*/