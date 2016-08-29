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
     * Returns true if angles are contra directional
     * @Note this method uses normalize internally to avoid problems when PI and 0 doesnt yield true
     * @Note make sure you have normalized both angles between -PI and +PI
     * @Note contra directinal can also be called inverse direction
     * print(Trig.isContraDirectional(Trig.PI, 0));//true, contra-dir
     * print(Trig.isContraDirectional(0, Trig.PI));//true, contra-dir
     * print(Trig.isContraDirectional(Trig.HPI, -Trig.HPI));//true, contra-dir
     * print(Trig.isContraDirectional(Trig.PI, -Trig.PI));//false, its co-dir
     * print(Trig.isContraDirectional(-Trig.PI, Trig.PI));//false, its co-dir
     */
    class func isContraDirectional(a:CGFloat,_ b:CGFloat) -> Bool {
        let normalizedA:CGFloat = Trig.normalize(a)
        //print("normalizedA: " + normalizedA)
        let inverseAngle:CGFloat = Trig.normalize(b-π)
        //print("inverseAngle: " + inverseAngle)
        return normalizedA == inverseAngle
    }
    /**
     * Asserts if angle @param a is parallel or anti-parallel to angle @param b
     * @Note input must be normalized between -PI and +PI
     * @Note this method treats both anti-Parallel and parallel as paralell
     * @Note two nonzero vectors are called anti-parallel if they are parallel but have opposite directions
     */
    class func isParallel(a:CGFloat,_ b:CGFloat) -> Bool {
        return isCodirectional(a, b) || isContraDirectional(a, b)
    }
    /**
     * beta
     * @Note make sure both angles have the same normilization applied
     * @Note normalize between 0 and 2PI since -PI and PI is co-dir but not equal// :TODO: but 0 and 2PI is also co-dir but not equal, fix it some other way
     */
    class func isCodirectional(a:CGFloat,_ b:CGFloat) -> Bool {
        if((a == π && b == -π) || (a == -π && b == π)) {return true}
        else {return a == b}
    }
    /**
     *
     */
    class func isNormal(angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        return isParallel(angle1, angle2 + (π/2))
    }
    /**
     *  Vectors lay on the on a line that is normal to the paralell or anti-parallel angles of both vectors
     *  @Note think the shape of the character "H" the two points connecting the bridge between the vertical lines are colliniear and normal
     *  // :TODO:  colliniarNormal is probably not the correct term for this construction, try to find the correct name and construction later
     */
    class func isCollinearNormal(p1:CGPoint,_ p2:CGPoint, _ angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        return isParallel(angle1, angle2) && isNormal(angle1, Trig.angle(p1, p2))
    }
    /**
     * NOTE: can also be defined as: "is when a trajectory hits the infinite tail of the other line"
     * NOTE: This method is simpler to use that the "trajectory-tail" method
     */
    class func isOppositeDirectional(bisectorAngle:CGFloat, _ angleA:CGFloat, _ angleB:CGFloat) -> Bool {
        let angleADiff:CGFloat = Trig.difference(bisectorAngle, angleA)
        let angleBDiff:CGFloat = Trig.difference(bisectorAngle, angleB)
        return (angleADiff < 0 && angleBDiff > 0) || (angleADiff > 0 && angleBDiff < 0)
    }
}