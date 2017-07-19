import Foundation

typealias IGraphicsGradient = GraphicsGradientKind
public protocol GraphicsGradientKind {
    var colors:[CGColor]{get set}
    var locations:[CGFloat]{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
extension GraphicsGradientKind{
    /**
     * Convert
     */
    func gradient()->GradientKind{
        if let gradient = (self as? LinearGraphicsGradient){
            return gradient.linearGradient()
        }else if let gradient = (self as? RadialGraphicsGradient){
            return gradient.radialGradient()
        }else{
            fatalError("type not supported")
        }
    }
}
