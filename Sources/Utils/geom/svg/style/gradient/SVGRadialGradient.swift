import Foundation
/*
 * TODO: ⚠️️ use c as CGPoint, use f as CGSize
 * TODO: ⚠️️ add fx="98.7581" fy="63.338"
 * NOTE: to scale the outer circle radius you have to use matrix transformations and then scale it, adjust the inner circle radius if you want this to remain the same size
 */
struct SVGRadialGradient:SVGGradientDecoratable {
    var gradient:SVGGradientKind
    var cx:CGFloat/*inner circle center x position*/
    var cy:CGFloat/*inner circle center y position*/
    var r:CGFloat/*radius represents the half the width and hight of the inner circle*/
    var fx:CGFloat/*outer circle center x position*/
    var fy:CGFloat/*outer circle center y position*/
    init(_ offsets:[CGFloat],_ colors:[CGColor], _ gradientUnits:String, _ spreadMethod:String, _ id:String, _ cx:CGFloat, _ cy:CGFloat, _ r:CGFloat, _ fx:CGFloat, _ fy:CGFloat, _ gradientTransform:CGAffineTransform? = nil){
        self.cx = cx
        self.cy = cy
        self.r = r
        self.fx = fx
        self.fy = fy
        self.gradient = SVGGradient.init(offsets, colors, spreadMethod, id, gradientUnits, gradientTransform)
    }
}
