import Foundation

typealias IGradientFillStyle = GradientFillStyleKind/*Legacy support*/
protocol GradientFillStyleKind:FillStyleKind{
    var gradient:IGradient{get set}
}
extension GradientFillStyleKind{
    func copy() -> GradientFillStyle {
        return GradientFillStyle(self.gradient.copy(),(self).color)
    }
    func mix(_ colors:Array<CGColor>)->GradientFillStyle{
        let c = copy()
        c.gradient.colors = colors
        return c
    }
}
