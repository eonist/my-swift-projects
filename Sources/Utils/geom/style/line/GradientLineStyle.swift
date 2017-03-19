import Cocoa

class GradientLineStyle:LineStyle,IGradientLineStyle {
    var gradient:IGradient
    init(_ gradient:IGradient,_ thickness:CGFloat = 1,_ color:NSColor = .black, _ lineCap:CGLineCap = .butt, _ lineJoin:CGLineJoin =  .miter, _ miterLimit:CGFloat = 10) {
        self.gradient = gradient
        super.init(thickness, color, lineCap, lineJoin, miterLimit)
    }
}
extension GradientLineStyle{/*Convenient*/
    convenience init(_ gradient:IGradient,_ lineStyle:ILineStyle) {
        self.init(gradient,lineStyle.thickness,lineStyle.color,lineStyle.lineCap,lineStyle.lineJoin, lineStyle.miterLimit);
    }
}
extension IGradientLineStyle{
    func copy() -> GradientLineStyle {
        return GradientLineStyle(gradient.copy(),thickness,color,lineCap,lineJoin,miterLimit)
    }
}
