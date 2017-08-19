import Foundation

//typealias GraphicsGradientKind = GraphicsGradientKind
public protocol GraphicsGradientKind {
    var cgGradient:CGGradient {get}
    var colors:[CGColor]{get set}
    var locations:[CGFloat]{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
extension GraphicsGradientKind{
    /**
     * Convert
     */
    func gradient()->GradientKind{
        switch self{
        case let gradient as LinearGraphicsGradient:
            return gradient.linearGradient()
        case let gradient as RadialGraphicsGradient:
            return gradient.radialGradient()
        default:
            fatalError("type not supported")
        }
    }
}
public protocol GraphicsGradientDecoratable:GraphicsGradientKind {
    var gradient:GraphicsGradient {get set}
}
extension GraphicsGradientDecoratable{
    public var colors:[CGColor]{get{return gradient.colors} set{gradient.colors = newValue}}
    public var locations:[CGFloat]{get{return gradient.locations} set{gradient.locations = newValue}}/*same as color stops*/
    public var transformation:CGAffineTransform?{get{return gradient.transformation} set{gradient.transformation = newValue}}
    public var cgGradient:CGGradient {return self.gradient.cgGradient}
}
