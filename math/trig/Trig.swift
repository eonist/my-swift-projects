import Foundation
var π = CGFloat(M_PI)/*Global variable*/
var π2 = CGFloat(M_PI_2)/*Global variable,pi/2*/
var π4 = CGFloat(M_PI_4)/*Global variable,pi/4*/
var ㎭ = π/180/*Global variable*/
class Trig{
    static var clockWise:String = "clockWise"
    static var counterClockWise:String = "counterClockWise"
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
}
extension Trig{//Legacy support/convenience
    class func angle(a:CGPoint, _ b:CGPoint)->CGFloat {return TrigParser.angle(a, b)}
    class func angleType(angleType:String)->CGFloat {return TrigUtils.angleType(angleType)}
    class func normalize(angle:CGFloat)->CGFloat {return TrigParser.normalize(angle)}
    class func normalize2(angle:CGFloat)->CGFloat {return TrigParser.normalize2(angle)}
    class func degrees(radians:CGFloat) -> CGFloat {return TrigConverter.degrees(radians)}
    class func radians(degrees:CGFloat) -> CGFloat {return TrigConverter.radians(degrees)}
    class func difference(startAngle:CGFloat,_ endAngle:CGFloat)->CGFloat {return TrigParser.difference(startAngle, endAngle)}
}