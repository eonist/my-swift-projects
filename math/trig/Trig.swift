import Foundation
var ㎭ = M_PI/180/*Global variable*/
var π = M_PI/*Global variable*/
class Trig{
    static var pi = M_PI//π
    static var π = pi
    static var left:Double = 180;
    static var right:Double = 0;
    static var bottom:Double = 90;
    static var top:Double = 270;
    static var rad:Double = M_PI / 180;//㎭, EXAMPLE: 90*Trig.rad//Output:π/4
    static var deg:Double = 180 / M_PI;//°, EXAMPLE: Trig.pi/4*Trig.deg//Output: 90
    /**
     * Returns an angle in radian between -3.14 and 3.14 (-180 and 180 converted to degress)
     * @param a is the pivot point
     * @param b is the polar point
     * @Note use this formula to find the angle in a (0,0) point-space Math.atan2(pointB.y, pointB.x)
     * @Note formula in standard form: Tan Ɵ = y/x (then use inverse tan to find the angle)
     */
    class func angle(a:CGPoint, b:CGPoint)->CGFloat {
        return atan2(b.y - a.y, b.x - a.x);
    }
    /**
     * Returns an angle in Degrees
     * @param angleType A string describing an angle in numeric value
     * @return angle in degrees (0-360)
     */
    class func angleType(angleType:String)->Double {
        if(angleType == "left") {return left}
        else if(angleType == "right") {return right}
        else if(angleType == "top") {return top}
        else {/*bottom*/ return bottom}
    }
    /**
     * Needs code
     */
    func cartesianToPolar(point:CGPoint)->(radius:CGFloat,angle:CGFloat){
        /* do some math here to get radius and angle */
        let radius = CGFloat(0.0)
        let angle = CGFloat(0.0)
        return (radius,angle)
    }
    /**
     * Converts an angle in degrees to radians.
     */
    class func degrees(radians:Double) -> Double {
        return π * radians / 180.0
    }
    /**
     * Converts an angle in radians to degrees.
     */
    class func radians(degrees:Double) -> Double {
        return degrees * 180.0 / π
    }
}