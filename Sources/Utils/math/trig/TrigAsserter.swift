import Foundation

class TrigAsserter {
    /**
     * NOTE: be cautiouse when the difference == Trig.PI since it can be in both states at the same time, anti clockwise and clockwise
     */
    static func isClockWise(_ center:CGPoint,_ p1:CGPoint,_ p2:CGPoint)->Bool {
        let a:CGFloat = TrigParser.angle(center, p1)
        let b:CGFloat = TrigParser.angle(center, p2)
        return isClockWiseByAngle(a, b)
    }
    /**
     * NOTE: if the difference is 0 then it can be arguably be clockwise and anti-clockwise at the same time, consider this in the calling method
     * NOTE: if the diff is 0 then its currently considered not clockwise, or anti-clockwise
     */
    static func isClockWiseByAngle(_ a:CGFloat,_ b:CGFloat)->Bool {
        let difference:CGFloat = TrigParser.difference(a, b)
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
     * NOTE: this method uses normalize internally to avoid problems when PI and 0 doesnt yield true
     * NOTE: make sure you have normalized both angles between -PI and +PI
     * NOTE: contra directinal can also be called inverse direction
     * EXAMPLE:
     * print(Trig.isContraDirectional(Trig.PI, 0));//true, contra-dir
     * print(Trig.isContraDirectional(0, Trig.PI));//true, contra-dir
     * print(Trig.isContraDirectional(Trig.HPI, -Trig.HPI));//true, contra-dir
     * print(Trig.isContraDirectional(Trig.PI, -Trig.PI));//false, its co-dir
     * print(Trig.isContraDirectional(-Trig.PI, Trig.PI));//false, its co-dir
     */
    static func isContraDirectional(_ a:CGFloat,_ b:CGFloat) -> Bool {
        let normalizedA:CGFloat = Trig.normalize(a)
        let inverseAngle:CGFloat = Trig.normalize(b-π)
        return normalizedA == inverseAngle
    }
    /**
     * Asserts if angle PARAM: a is parallel or anti-parallel to angle PARAM: b
     * NOTE: input must be normalized between -PI and +PI
     * NOTE: this method treats both anti-Parallel and parallel as paralell
     * NOTE: two nonzero vectors are called anti-parallel if they are parallel but have opposite directions
     */
    static func isParallel(_ a:CGFloat,_ b:CGFloat) -> Bool {
        return isCodirectional(a, b) || isContraDirectional(a, b)
    }
    /**
     * NOTE: make sure both angles have the same normilization applied
     * NOTE: normalize between 0 and 2PI since -PI and PI is co-dir but not equalTODO: but 0 and 2PI is also co-dir but not equal, fix it some other way
     */
    static func isCodirectional(_ a:CGFloat,_ b:CGFloat) -> Bool {
        if((a == π && b == -π) || (a == -π && b == π)) {return true}
        else {return a == b}
    }
    static func isNormal(_ angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        return isParallel(angle1, angle2 + (π/2))
    }
    /**
     * Vectors lay on the on a line that is normal to the paralell or anti-parallel angles of both vectors
     * NOTE: think the shape of the character "H" the two points connecting the bridge between the vertical lines are colliniear and normal
     * TODO:  colliniarNormal is probably not the correct term for this construction, try to find the correct name and construction later
     */
    static func isCollinearNormal(_ p1:CGPoint,_ p2:CGPoint, _ angle1:CGFloat,_ angle2:CGFloat) -> Bool {
        return isParallel(angle1, angle2) && isNormal(angle1, Trig.angle(p1, p2))
    }
    /**
     * NOTE: can also be defined as: "is when a trajectory hits the infinite tail of the other line"
     * NOTE: This method is simpler to use that the "trajectory-tail" method
     * PARAM: bisectorAngle can be thought of as the level angle. Usually 0, but can be other things (think 3 conected lines where the bisectorAngle represents the angle of the line in the middle)
     */
    static func isOppositeDirectional(_ bisectorAngle:CGFloat, _ angleA:CGFloat, _ angleB:CGFloat) -> Bool {
        let angleADiff:CGFloat = Trig.difference(bisectorAngle, angleA)
        let angleBDiff:CGFloat = Trig.difference(bisectorAngle, angleB)
        return (angleADiff < 0 && angleBDiff > 0) || (angleADiff > 0 && angleBDiff < 0)
    }
    /**
     * NOTE: just an alternative to isOppositeDirectional (isOppositeDirectional should be faster than this one)
     * PARAM: bisectorAngle can be thought of as the level angle. Usually 0, but can be other things (think 3 conected lines where the bisectorAngle represents the angle of the line in the middle)
     */
    static func isOppositeDirectional2(_ bisectorAngle:CGFloat, _ angleA:CGFloat, _ angleB:CGFloat)  -> Bool {
       return (Trig.angleSpan2(angleA,bisectorAngle) < π && Trig.angleSpan2(angleB,bisectorAngle) > π) || (Trig.angleSpan2(angleA,bisectorAngle) > π && Trig.angleSpan2(angleB,bisectorAngle) < π)
    }
    /**
     * new
     */
    static func isCoDir(_ a:CGFloat,_ b:CGFloat) -> Bool {
        let normalizedA:CGFloat = Trig.normalize(a)
        let normalizedB:CGFloat = Trig.normalize(b)
        return normalizedA == normalizedB
    }
}
