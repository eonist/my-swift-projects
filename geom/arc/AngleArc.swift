import Foundation
/**
 * Data container class
 */
class AngleArc {
    var start:CGFloat
    var end:CGFloat
    var xRadii:CGFloat
    var yRadii:CGFloat
    var rotation:CGFloat
    var center:CGPoint
    init(_ start:CGFloat,_ end:CGFloat,_ xRadii:CGFloat,_ yRadii:CGFloat, _ center:CGPoint,_ rotation:CGFloat = 0) {
        self.start = start
        self.end = end
        self.xRadii = xRadii
        self.yRadii = yRadii
        self.rotation = rotation
        self.center = center
    }
}
extension AngleArc{
    var x:CGFloat {get {return center.x} set {center.x = newValue}}/*convenience*/
    var y:CGFloat {get {return center.y} set {center.y = newValue}}/*convenience*/
    var transform:CGAffineTransform {get {return CGAffineTransformMakeScale(xRadii/yRadii, yRadii/xRadii)} /*set{} */}
    var delta:CGFloat {return TrigParser.angleSpan(start, end)}
    func describe(){
        Swift.print("start: " + "\(start)")
        Swift.print("end: " + "\(end)")
        Swift.print("delta: " + "\(delta)")
        Swift.print("xRadii: " + "\(xRadii)")
        Swift.print("yRadii: " + "\(yRadii)")
        Swift.print("rotation: " + "\(rotation)")
        Swift.print("center: " + "\(center)")
    }
}