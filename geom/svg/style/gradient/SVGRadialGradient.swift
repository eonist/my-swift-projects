import Foundation
/*
 * // :TODO: add an example here
 * // :TODO: add fx="98.7581" fy="63.338" 
 */
class SVGRadialGradient {
    var cx:CGFloat
    var cy:CGFloat
    var r:CGFloat/*radius*/
    var fx:CGFloat
    var fy:CGFloat
    init(offsets:Array, colors:Array, opacities:Array, gradientUnits:String, spreadMethod:String, id:String, cx:CGFLoat, cy:CGFloat, r:CGFloat, fx:CGFloat, fy:CGFloat/*, gradientTransform:Matrix*/){
        self.cx = cx;
        self.cy = cy;
        self.r = r;
        self.fx = fx;
        self.fy = fy;
        super(offsets,colors,opacities,spreadMethod,id,gradientUnits,gradientTransform);
    }
}