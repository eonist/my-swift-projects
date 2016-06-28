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
     * Returns a radian to be between 0 and Math.PI*2 Radian (0 - 6.28)
     * @param theta: An radian in degrees typically 0 - Math.PI*2
     * @Note: we use "while" function type here because angle could be very low at which point Math.PI*2 needs to be contrinuasly added until its above 0 )
     * // :TODO: use modulo like normalize2 does, is that faster ? do an optimization test.
     */
    class func normalize(var angle:CGFloat)->CGFloat {
        while (angle < 0) {angle += π*2}
        while (angle >= π*2) {angle -= π*2}
        return angle
    }
    /**
     * Returns a x value on the circle circumference correlating to the intersecting x axis derrived from the @param y
     * @Note Based on the Circle formula: (x-h)^2+(y-k)^2 = r^2 (where h and k are the center of the circle)
     * @param y the y value
     * @param r the radius of the sphere
     * @param p the position of the sphere
     */
    class func x(y:CGFloat,r:CGFloat,p:CGPoint) -> CGFloat {
        return sqrt(pow(r, 2)-pow(y-p.y, 2)) + p.x
    }
    /**
     * Returns a y value on the circle circumference correlating to the intersecting x axis derrived from the @param x value
     * @Note Based on the Circle formula: (x-h)^2+(y-k)^2 = r^2 (where h and k are the center of the circle)
     * @Note this method works as it is suppose to
     * @param x the x value
     * @param r the radius of the sphere
     * @param p the position of the sphere
     */
    class func y(x:CGFloat,_ r:CGFloat,_ p:CGPoint)->CGFloat {
        return sqrt(pow(r, 2)-pow(x-p.x, 2)) + p.y
    }
    /**
     * Returns an radian to be between -Math.PI(-3.14) and Math.PI(3.14)
     * @param theta: An radian in degrees typically 0 - Math.PI*2
     */
    class func normalize2(angle:CGFloat)->CGFloat {
        if(angle < -π){ return π + (angle % π)}
        if(angle > π){ return -π + (angle % π)}
        return angle
    }
    /**
     * Returns the difference between two angles, positive or negative
     * @param startAngle (in radian)
     * @param endAngle (in radian)
     */
    class func difference(startAngle:CGFloat,_ endAngle:CGFloat)->CGFloat {
        return atan2(sin(endAngle - startAngle), cos(endAngle - startAngle))
    }
    /**
     * @Note this is the same as the above but works with a boolean which makes more sence, deprecate pointSpan
     */
    class func pointSpan2(p1:CGPoint,_ p2:CGPoint,_ pivot:CGPoint,_ isClockWise:Bool = true)->CGFloat {
        let a:CGFloat = Trig.angle(pivot,p1)
        let b:CGFloat = Trig.angle(pivot,p2)
        return TrigParser.angleSpan2(a,b,isClockWise)
    }
    /**
    * Returns the span in a clockwise or counterclockwise direction (radian between 0 and Math.PI*2)
    * @param direction is of the Direction.CLOCK_WISE or Direction.COUNTER_CLOCK_WISE type
    * @param a (-Math.PI to Math.PI)
    * @param b (-Math.PI to Math.PI)
    * @Note This method works great when finding angles in a triangle
    * @Note Using NumberParser.distance(a,b) to find an angle span doesnt work
    * @example:
    * angleSpan(Math.PI*-0.5, Math.PI,Direction.COUNTER_CLOCK_WISE);//Math.PI*-0.5 to Math.PI = 4.71
    * angleSpan(Math.PI, Math.PI*0.5,Direction.COUNTER_CLOCK_WISE);//Math.PI to Math.PI*0.5 = 4.71
    * // :TODO: replace direction with boolean: isClockWise
    */
    class func angleSpan(a:CGFloat, _ b:CGFloat, _ direction:String = Trig.clockWise) -> CGFloat{
        if(direction == Trig.clockWise) {return Trig.normalize(b + (Trig.pi*2-a))}
        return Trig.normalize(a + (Trig.pi*2-b))/*Direction.COUNTER_CLOCK_WISE*/
    }
    /**
     * @Note this is the same as the above but works with a boolean which makes more sence, deprecate angleSpan1
     */
    class func angleSpan2(a:CGFloat, _ b:CGFloat, _ isClockWise:Bool = true) -> CGFloat {
        return angleSpan(a, b, isClockWise ? Trig.clockWise : Trig.counterClockWise)
    }
}