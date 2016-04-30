import Foundation
var π = CGFloat(M_PI)/*Global variable*/
var π2 = CGFloat(M_PI_2)/*Global variable,pi/2*/
var π4 = CGFloat(M_PI_4)/*Global variable,pi/4*/
var ㎭ = π/180/*Global variable*/

class Trig{
    static var pi:CGFloat = π
    static var left:CGFloat = 180;
    static var right:CGFloat = 0;
    static var bottom:CGFloat = 90;
    static var top:CGFloat = 270;//-90
    static var rad:CGFloat = π / 180;//㎭, EXAMPLE: 90*Trig.rad//Output:π/4
    static var deg:CGFloat = 180 / π;//°, EXAMPLE: Trig.pi/4*Trig.deg//Output: 90
    static var t:(CGFloat, CGFloat) = (-π/4,-π*0.75);
    static var b:(CGFloat, CGFloat) = (π/4,π*0.75);
    static var l:(CGFloat, CGFloat) = (Trig.normalize(π*0.75), Trig.normalize(-π*0.75));/*remember to normalize the angle to test against this value to be between 0 - PI*2*/
    static var r:(CGFloat, CGFloat) = (-π/4, π/4);
    static var tl:(CGFloat,CGFloat) = (-π,-π/2)//(-180*㎭,-90*㎭)
    static var tr:(CGFloat,CGFloat) = (-π/2,0)//(-90*㎭,0)
    static var bl:(CGFloat,CGFloat) = (0,π/2)//(0,90*㎭)
    static var br:(CGFloat,CGFloat) = (π/2,π)//(90*㎭,180*㎭)
    
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

    func cartesianToPolar(point:CGPoint)->(radius:CGFloat,angle:CGFloat){return TrigParser.cartesianToPolar(point)}

        
    

    class func degrees(radians:CGFloat) -> CGFloat {return TrigParser.degrees(radians)}
        
    
    class func radians(degrees:CGFloat) -> CGFloat {return TrigParser.radians(degrees)}
        
    

}