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