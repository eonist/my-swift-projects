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
            return linearGradient()
        }else if(self is RadialGraphicsGradient){
            return radialGradient()
        }else{
            fatalError("type not supported")
        }
    }
    func linearGradient()->LinearGradient{
        return LinearGradient(self.colors,self.locations,1.5707963267949,self.transformation)/*<--I dont like the rotation value here*/
    }
    
}