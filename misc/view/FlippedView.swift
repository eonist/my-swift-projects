import Cocoa
import Foundation
protocol IView{
    var layer: CALayer?{get}//TODO:remove?
    var bounds: NSRect{get}
    var frame: NSRect{get set}
    func addSubview(aView: NSView)
}
class FlippedView:NSView{//Organizes your view from top to bottom
    override var flipped:Bool {
        get {
            return true
        }
    }
}