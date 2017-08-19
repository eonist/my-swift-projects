import Foundation

protocol GradientKind {
    var colors:[CGColor]{get set}
    var locations:[CGFloat]{get set}
    var rotation:CGFloat{get set}/*between -π and π*/
}
extension GradientKind{
    func copy() -> GradientKind {
        switch self {
        case is LinearGradient:
            return LinearGradient(colors,locations,rotation)
        case let gradient as RadialGradient:
            return RadialGradient(colors,locations,rotation,gradient.startCenter,gradient.endCenter,gradient.startRadius,gradient.endRadius)
        default:
            fatalError("Not available")
        }
    }
}
