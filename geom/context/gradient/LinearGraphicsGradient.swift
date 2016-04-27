import Foundation
/**
 *
 */
public class LinearGraphicsGradient:GraphicsGradient{
    public var p1:CGPoint
    public var p2:CGPoint
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ transformation:CGAffineTransform? = nil,_ p1:CGPoint, _ p2:CGPoint){
        self.p1 = p1
        self.p2 = p2
        super.init(colors,locations,transformation)
    }
}
extension LinearGraphicsGradient{
    func linearGradient()->LinearGradient{
        return LinearGradient(self.colors,self.locations,1.5707963267949,self.transformation)/*<--I dont like the rotation value here*/
    }
}
