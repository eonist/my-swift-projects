import Cocoa
/**
 * Now you can use all the methods provided by IPositional
 */
extension NSText:IPositional{
    var pos:CGPoint{get{return frame.origin} set{frame.origin = newValue}}
    func setPosition(_ position:CGPoint) {
        frame.origin = position
    }
    func getPosition() -> CGPoint {
        return frame.origin
    }
}
extension NSTextField:IPositional{
    var pos:CGPoint{get{return frame.origin} set{frame.origin = newValue}}
    func setPosition(_ position:CGPoint) {
        frame.origin = position
    }
    func getPosition() -> CGPoint {
        return frame.origin
    }
}
