import Foundation
typealias IGradientLineStyle = GradientLineStylable
protocol GradientLineStylable:LineStylable {
    var gradient:IGradient{get set}
}
extension GradientLineStylable{
    func mix(_ colors:[CGColor])->GradientLineStyle{
        let c = copy()
        c.gradient.colors = colors
        return c
    }
}
