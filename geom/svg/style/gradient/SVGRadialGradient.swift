import Foundation
/*
 * // :TODO: add an example here
 * // :TODO: add fx="98.7581" fy="63.338"
 */
class SVGRadialGradient:SVGGradient {
    var cx:CGFloat/*inner circle center x position*/
    var cy:CGFloat
    var r:CGFloat/*radius represents the half the width and hight of the inner circle*/
    var fx:CGFloat
    var fy:CGFloat
    init(_ offsets:Array<CGFloat>,_ colors:Array<CGColor>,/*_ opacities:Array<CGFloat>,*/ _ gradientUnits:String, _ spreadMethod:String, _ id:String, _ cx:CGFloat, _ cy:CGFloat, _ r:CGFloat, _ fx:CGFloat, _ fy:CGFloat, _ gradientTransform:CGAffineTransform? = nil/**/){
        self.cx = cx;
        self.cy = cy;
        self.r = r;
        self.fx = fx;
        self.fy = fy;
        super.init(offsets,colors,/*opacities*/spreadMethod,id,gradientUnits,gradientTransform);
    }
}