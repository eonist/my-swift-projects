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
 * TODO: revamp the gradient system, you need transformation and gradientbox should be applied as a transformation not in graphics.
 */


 
 /*
 
Solution:
 
You need to operate in percentage values from left to right, and you need to do this in the coordinate system of the boundingbox of the path
@NOTE: svg will need to operate in boundingbox and viewbox coordinatespace. when svg uses the viewbox coordinatespace you just use the boundingbox and offset the gradient points percentage wise. 
@NOTE: css needs a different approach, when using the radial gradient it uses the percentage from the center etc, this can be done in the css classes tht then set the gradient classes of the Graphics instance
@NOTE: css also bases its persentage values from crossing between the normal and the edges. this can also be done in in the css classes
@NOTE:
@NOTE: The reason the Graphics class needs to operate with percentage values is because the Graphics may be scaled, actually that is not true, it wont be scaled, you scale in the Graphic class not in the Graphics class so you can hold absolute coordinates. 
@NOTE:
@NOTE: Support Matrix transformation
 
 
TODO: when you set the gradient points use absolute values, there is no need to use % values, you can doo all the GradientBox calculations in the Graphic instance etc, Keep Graphics simple.
TODO: setup gradient tests for css,graphic framework, svg. all different gradients and offsets, everything should work. also matrix transformations etc
TODO: start by setting up a grid of Graphic framework gradients
TODO: then do the css gradient tests
TODO: then setup the svg gradients
TODO: then start refactoring the Graphics class related to the Gradient config methods etc, and start moving them into GradientGraphic etc. 
 
*/
 
//Continue here: in order to move forward we need to seperate radial and linear gradient types. this class should provide the common denominator of the two possible three (concial gradient)
//Radial gradient should maybe suport a dual system of focal and 2 point system
//Linear and Radial should support both absolute and relative values and also both boundingbox and ...or only bounding box? Think!


public class Gradient:IGradient{/*<---its public so that it works in playground*/
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>/*same as color stops*/
    public var gradientType:GradientType//TODO: rename to type TODO: use Linear and Radial gradient to represent type
    public var rotation:CGFloat;/*this doesnt belong here, you apply rotations in the matrix, for now its fine*/
    public var relativeStartCenter:CGPoint?//0 to 1 (x:0.5 means half way accross the boundingbox etc) (from the intersection of the normal and an edge in the boundingbox)(ACtually use scalar values from -1 to 0 to +1 since 1 is absolutly presice aposed to 0.5 which can return fractions. zero is also absolute)
    public var relativeEndCenter:CGPoint?//0 to 1 (same as relativeEndCenter)
    public var relativeStartRadius:CGSize?//0 to 1 (x:0.5 means half the size of the current cross-section in the x-axis) the x-axis is determined by the rotation
    public var relativeEndRadius:CGSize?//0 to 1 (same as relativeStartRadius)
    public var p1:CGPoint?/*<--temp*/
    public var p2:CGPoint?
    public var transformation:CGAffineTransform?
    public var useBoundingBox:Bool/*<--new toggles the usage of absolute values to the path coordinates and relative values to the boundingBox*/
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Linear,_ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/,_ relativeStartCenter:CGPoint? = nil,_ relativeEndCenter:CGPoint? = nil,_ relativeStartRadius:CGSize? = nil,_ relativeEndRadius:CGSize? = nil, _ p1:CGPoint? = nil, _ p2:CGPoint? = nil,_ useBoundingBox:Bool = false, _ transformation:CGAffineTransform? = nil){/*,*/
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
        self.p1 = p1
        self.p2 = p2
        self.useBoundingBox = useBoundingBox
        self.transformation = transformation
    }
}

