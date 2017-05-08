import Cocoa

protocol IView:class{/*the :class enables you to set variables via extension etc*/
    var layer:CALayer?{get}//TODO:remove?
    var bounds:NSRect{get}
    var frame:NSRect{get set}
    func addSubview(_ aView: NSView)
}
