import Cocoa
/**
 * TODO: ⚠️️ you can also just cast to NSView! So remove this class
 */
protocol ViewKind:class{/*the :class enables you to set variables via extension etc*/
    var layer:CALayer?{get}//TODO:remove?
    var bounds:NSRect{get}
    var frame:NSRect{get set}
    func addSubview(_ aView: NSView)
}
