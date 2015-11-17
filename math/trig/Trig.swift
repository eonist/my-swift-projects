import Foundation
class Trig{
    static var pi = M_PI//π
    static var left:Double = 180;
    static var right:Double = 0;
    static var bottom:Double = 90;
    static var top:Double = 270;
    static var rad:Double = pi / 180;//㎭, EXAMPLE: 90*Trig.rad//Output:π/4
    static var deg:Number = 180 / Math.PI;
    
    
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
    public func degreesToRadians() -> CGFloat {
        return π * self / 180.0
    }
    
    /**
     * Converts an angle in radians to degrees.
     */
    public func radiansToDegrees() -> CGFloat {
        return self * 180.0 / π
    }
}