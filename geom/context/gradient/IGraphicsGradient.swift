import Foundation
/**
 *
 */
public protocol IGraphicsGradient {
    var colors:Array<CGColor>{get set}
    var locations:Array<CGFloat>{get set}/*same as color stops*/
    var transformation:CGAffineTransform?{get set}
}
extension IGraphicsGradient{
    /**
     *
     */
    func gradient()->IGradient{
        if(self is LinearGraphicsGradient){
            return LinearGradient()
        }else if(self is RadialGraphicsGradient){
            //return
        }else{
            fatalError("type not supported")
        }
    }
}