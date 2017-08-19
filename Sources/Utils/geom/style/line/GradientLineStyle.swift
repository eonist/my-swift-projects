import Cocoa
/**
 * TODO: ⚠️️ Convert to struct
 */
class GradientLineStyle:LineStyle,GradientLineStylable {
    var gradient:GradientKind
    init(_ gradient:GradientKind,_ thickness:CGFloat = 1,_ color:NSColor = .black, _ lineCap:CGLineCap = .butt, _ lineJoin:CGLineJoin =  .miter, _ miterLimit:CGFloat = 10) {
        self.gradient = gradient
        super.init(thickness, color, lineCap, lineJoin, miterLimit)
    }
}
extension GradientLineStyle{/*Convenient*/
    convenience init(_ gradient:GradientKind,_ lineStyle:LineStylable) {
        self.init(gradient,lineStyle.thickness,lineStyle.color,lineStyle.lineCap,lineStyle.lineJoin, lineStyle.miterLimit);
    }
}
extension GradientLineStylable{
    func copy() -> GradientLineStyle {
        return GradientLineStyle(gradient.copy(),thickness,color,lineCap,lineJoin,miterLimit)
    }
}
