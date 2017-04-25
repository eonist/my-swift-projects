import Foundation
/**
 * Data container class
 * TODO: ⚠️️ Use struct instead?, does anythingextend this class?
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
    var transform:CGAffineTransform {get {return CGAffineTransform(scaleX: xRadii/yRadii, y: yRadii/xRadii)} /*set{} */}
    var delta:CGFloat {
        let isClockWise:Bool = Trig.isClockWiseByAngle(start, end)
        //Swift.print("isClockWise: " + "\(isClockWise)")
        //you need a directional anglespan, that can return negative values!?!?
        var angleSpan:CGFloat = TrigParser.angleSpan2(start, end, isClockWise)
        angleSpan = isClockWise ? angleSpan : -angleSpan/*get the directional vaue*/
        return angleSpan
    }
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
