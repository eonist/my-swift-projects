import Cocoa
class FlippedView:NSView {//Organizes your view from top to bottom
    override var flipped:Bool {
        get {
            return true
        }
    }
}