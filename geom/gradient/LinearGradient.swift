import Foundation
/**
 * NOTE: there is no TopLeft or BottomRight etc in the CSS sepcs so no need to have more complex relative positioning in this class
 * NOTE: why do we have this class when its basically the same as Gradient? Because the alternative is to ad another value to to Gradient to represent Gradient Type.
 */
public class LinearGradient:Gradient {
    override init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ rotation:CGFloat = 1.5707963267949, _ transformation:CGAffineTransform? = nil){
        super.init(colors, locations,rotation,transformation)
    }
}
extension LinearGradient{
    convenience init(_ gradient:IGradient){
        self.init(gradient.colors,gradient.locations,gradient.rotation)
    }
}