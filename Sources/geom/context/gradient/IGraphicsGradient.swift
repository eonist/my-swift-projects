import Foundation

public protocol IGraphicsGradient {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
extension IGraphicsGradient{
    /**
     * Convert
     */
    func gradient()->IGradient{
        if(self is LinearGraphicsGradient){
            return (self as! LinearGraphicsGradient).linearGradient()
        }else if(self is RadialGraphicsGradient){
            return (self as! RadialGraphicsGradient).radialGradient()
        }else{
            fatalError("type not supported")
        }
    }
}