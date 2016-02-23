import Cocoa
import Foundation
protocol IView:class{/*the :class enables you to set variables via extension*/
    var layer: CALayer?{get}//TODO:remove?
    var bounds: NSRect{get}
    var frame: NSRect{get set}
    func addSubview(aView: NSView)
}
class FlippedView:NSOpenGLView{
    override init?(frame frameRect: NSRect, pixelFormat format: NSOpenGLPixelFormat?) {
        super.init(frame: frameRect, pixelFormat: NSOpenGLView.defaultPixelFormat())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var flipped:Bool {return true}/*Organizes your view from top to bottom*/
}