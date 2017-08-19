import Foundation

protocol GradientFillStyleKind:FillStyleKind{
    var gradient:GradientKind{get set}
}
extension GradientFillStyleKind{
    /**
     * Returns a new instance of self
     */
    func copy() -> GradientFillStyle {
        return .init(self.gradient.copy(),self.color)
    }
    /**
     * Creates a copy of self, sets the PARAM: colors, returns the new instance
     */
    func mix(_ colors:[CGColor])->GradientFillStyle{
        let c = copy()
        c.gradient.colors = colors
        return c
    }
}
