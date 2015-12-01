import Cocoa
/**
 * Now you can use all the methods provided by IPositional
 */
extension NSText : IPositional{
    var position:CGPoint{get{return frame.origin} set{frame.origin = newValue}}
    func setPosition(position:CGPoint) {
        self.position = position
    }
    func getPosition() -> CGPoint {
        return self.position
    }
}
