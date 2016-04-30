import Foundation

class TrigParser {
    /**
     * Returns an angle in radian between -3.14 and 3.14 (-180 and 180 converted to degress)
     * @param a is the pivot point
     * @param b is the polar point
     * @Note use this formula to find the angle in a (0,0) point-space Math.atan2(pointB.y, pointB.x)
     * @Note formula in standard form: Tan Ɵ = y/x (then use inverse tan to find the angle)
     */
    class func angle(a:CGPoint, _ b:CGPoint)->CGFloat {
        return atan2(b.y - a.y, b.x - a.x);
    }
    /**
     * Returns an angle in Degrees
     * @param angleType A string describing an angle in numeric value
     * @return angle in degrees (0-360)
     */
    class func angleType(angleType:String)->CGFloat {
        if(angleType == "left") {return left}
        else if(angleType == "right") {return right}
        else if(angleType == "top") {return top}
        else {/*bottom*/ return bottom}
    }
    /**
     * Returns a radian to be between 0 and Math.PI*2 Radian (0 - 6.28)
     * @param theta: An radian in degrees typically 0 - Math.PI*2
     * @Note: we use "while" function type here because angle could be very low at which point Math.PI*2 needs to be contrinuasly added until its above 0 )
     * // :TODO: use modulo like normalize2 does, is that faster ? do an optimization test.
     */
    class func normalize(var angle:CGFloat)->CGFloat {
        while (angle < 0) {angle += π*2};
        while (angle >= π*2) {angle -= π*2};
        return angle;
    }
    /**
     * Returns an radian to be between -Math.PI(-3.14) and Math.PI(3.14)
     * @param theta: An radian in degrees typically 0 - Math.PI*2
     */
    class func normalize2(angle:CGFloat)->CGFloat {
        if(angle < -π){ return π + (angle % π)};
        if(angle > π){ return -π + (angle % π)};
        return angle;
    }
    /**
     * Converts an angle in degrees to radians.
     * NOTE: its easier to just do: 45*㎭
     * NOTE: can also be defined: rad * (180 / π)
     */
    class func degrees(radians:CGFloat) -> CGFloat {
        return π * radians / 180.0
    }
    /**
     * Converts an angle in radians to degrees.
     * NOTE: can also be defined degrees * (π / 180)
     */
    class func radians(degrees:CGFloat) -> CGFloat {
        return degrees / 180.0 * π
    }

}
