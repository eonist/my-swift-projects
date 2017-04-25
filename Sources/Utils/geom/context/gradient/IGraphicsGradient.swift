import Foundation

public protocol IGraphicsGradient {
    var colors:[CGColor]{get set}
    var locations:[CGFloat]{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
extension IGraphicsGradient{
    /**
     * Convert
     */
    func gradient()->IGradient{
        if let gradient = (self as? LinearGraphicsGradient){
            return gradient.linearGradient()
        }else if let gradient = (self as? RadialGraphicsGradient){
            return gradient.radialGradient()
        }else{
            fatalError("type not supported")
        }
    }
}
