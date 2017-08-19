import Foundation

protocol GradientLineStylable:LineStylable {
    var gradient:GradientKind{get set}
}
extension GradientLineStylable{
    func mix(_ colors:[CGColor])->GradientLineStyle{
        let c = copy()
        c.gradient.colors = colors
        return c
    }
}
