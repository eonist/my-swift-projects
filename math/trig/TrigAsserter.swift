import Foundation

class TrigAsserter {
    /**
     * @Note be cautiouse when the difference == Trig.PI since it can be in both states at the same time, anti clockwise and clockwise
     */
    class func isClockWise(center:CGPoint,_ p1:CGPoint,_ p2:CGPoint)->Bool {
        //print("center: " + "\(center)")
        //print("p1: " + "\(p1)")
        //print("p2: " + "\(p2)")
        let a:CGFloat = TrigParser.angle(center, p1)
        //print("a: " + "\(b)")
        let b:CGFloat = TrigParser.angle(center, p2)
        //print("b: " + "\(b)")
        return isClockWiseByAngle(a, b)
    }
    /**
     * @Note if the difference is 0 then it can be arguably be clockwise and anti-clockwise at the same time, consider this in the calling method
     * @Note if the diff is 0 then its currently considered not clockwise, or anti-clockwise
     */
    class func isClockWiseByAngle(a:CGFloat,_ b:CGFloat)->Bool {
        let difference:CGFloat = TrigParser.difference(a, b)
        //print("  "+"  "+"  "+"  "+"difference: " + "\(difference)");
        if(difference == Trig.pi || difference == -Trig.pi){
            return true
        }else if(difference == 0) {
            return false
        }else {
            return difference > 0
        }
    }
    /**
     * NOTE: can also be defined as: "is when a trajectory hits the infinite tail of the other line"
     * NOTE: THis method is simpler to use that the "trajectory-tail" method
     */
    class func isOppositeDirectional(bisectorAngle:CGFloat, _ angleA:CGFloat, _ angleB:CGFloat) -> Bool {
        let angleADiff:CGFloat = Trig.difference(bisectorAngle, angleA)
        let angleBDiff:CGFloat = Trig.difference(bisectorAngle, angleB)
        return (angleADiff < 0 && angleBDiff > 0) || (angleADiff > 0 && angleBDiff < 0)
    }
}