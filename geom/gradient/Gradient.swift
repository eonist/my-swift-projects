import Cocoa
public enum GradientType:Int{//TODO:move to its own class?
    case Axial = 0, Radial//TODO: rename Axial to linear
}
/**
 * EXAMPLE: let gradient:Gradient = Gradient([NSColor.blueColor().CGColor,NSColor.redColor().CGColor])
 * TODO: create two Gradient classes the extends a common Gradient class. LinearGradient and RadialGradient, ILinearGradient, IRadialGradient etc
 */
public class Gradient:IGradient{
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>
    public var gradientType:GradientType
    public var rotation:CGFloat;/*this doesnt belong here, you apply rotations in the matrix*/
    public var relativeStartCenter:CGPoint?//0 to 1 (x:0.5 means half way accross the boundingbox etc)
    public var relativeEndCenter:CGPoint?//0 to 1
    public var relativeStartRadius:CGSize?//0 to 1 (x:0.5)
    public var relativeEndRadius:CGSize?//0 to 1
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Axial,_ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/){/*,*/
        self.colors = colors
        if (locations.count == 0/* && colors.count > 0*/) {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        self.gradientType = gradientType
        self.rotation = rotation
    }
}

