import Foundation
/**
 * @NOTE: Focal length:
 */
public class RadialGradient:Gradient {
    public var startCenter:CGPoint?/*should be 0.5,0.5 to mimic the focal ratio radial system*/
    public var endCenter:CGPoint?/*y = focalRatio (-1 to +1) */
    public var startRadius:CGSize?
    public var endRadius:CGSize?/*should be 0,0 to mimic the focal ratio radial gradient system*/
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ rotation:CGFloat = 1.5707963267949, _ startCenter:CGPoint? = nil,_ endCenter:CGPoint? = nil,_ startRadius:CGSize? = nil,_ endRadius:CGSize? = nil,_ transformation:CGAffineTransform? = nil){
        super.init(colors, locations,rotation, transformation)
        self.startCenter = startCenter
        self.endCenter = endCenter
        self.startRadius = startRadius
        self.endRadius = endRadius
    }
}
extension RadialGradient{
    convenience init(_ gradient:IGradient){
        self.init(gradient.colors,gradient.locations,gradient.rotation)
    }
}