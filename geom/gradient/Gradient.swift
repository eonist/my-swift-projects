import Cocoa
public enum GradientType:Int{//TODO:move to its own class?
    case Linear = 0, Radial//TODO: rename Axial to linear, axial should maybe be the spread out fan gradient?
}
/**
 * The overall goal of this class is to provide a universal way to define gradients on a graphic. IMPORTANT ->>> So that if you scale the graphic the gradient will not look strange. <<<- IMPORTANT
 * EXAMPLE: let gradient:Gradient = Gradient([NSColor.blueColor().CGColor,NSColor.redColor().CGColor])
 * NOTE: the radial scalar values can also be more or less than 0 and 1. think width * 1.2 etc. Works for both pos and size. (the only thing that is capped is the size if it goes under 0, then it is capped to 0)
 * NOTE: Why are we using realtive values for the radial gradient when xcode supports absolute points? Because absolute values cant be applied to different graphics. Absolute values only work with one exact graphic.
 * NOTE: the scalar values are subjected to change, if -1 to +1 makes more sense when doing the polar point calculations etc
 * TODO: Find that medium article on axial gradient. the one that looks like a "spread out patonefan"
 * TODO: create two Gradient classes the extends a common Gradient class. LinearGradient and RadialGradient, ILinearGradient, IRadialGradient etc
 */
public class Gradient:IGradient{/*<---its public so that it works in playground*/
    
    
    //continue here: revamp the gradient system, you need transformation and gradientbox should be applied as a transformation not in graphics.
    //but in order to keep thing s moving, add a few more params and see if it works, add p1 and p2, then come back later to revamp the gradient lib
    
    
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>
    public var gradientType:GradientType//TODO: rename to type
    public var rotation:CGFloat;/*this doesnt belong here, you apply rotations in the matrix, for now its fine*/
    public var relativeStartCenter:CGPoint?//0 to 1 (x:0.5 means half way accross the boundingbox etc) (from the intersection of the normal and an edge in the boundingbox)(ACtually use scalar values from -1 to 0 to +1 since 1 is absolutly presice aposed to 0.5 which can return fractions. zero is also absolute)
    public var relativeEndCenter:CGPoint?//0 to 1 (same as relativeEndCenter)
    public var relativeStartRadius:CGSize?//0 to 1 (x:0.5 means half the size of the current cross-section in the x-axis) the x-axis is determined by the rotation
    public var relativeEndRadius:CGSize?//0 to 1 (same as relativeStartRadius)
    public var p1:CGPoint?/*<--temp*/
    public var p2:CGPoint?
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Linear,_ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/,_ relativeStartCenter:CGPoint? = nil,_ relativeEndCenter:CGPoint? = nil,_ relativeStartRadius:CGSize? = nil,_ relativeEndRadius:CGSize? = nil, p1:CGPoint? = nil, p2:CGPoint? = nil){/*,*/
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
        self.relativeStartCenter = relativeStartCenter
        self.relativeEndCenter = relativeEndCenter
        self.relativeStartRadius = relativeStartRadius
        self.relativeEndRadius = relativeEndRadius
    }
}

