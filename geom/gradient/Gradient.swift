import Foundation
/**
 * The overall goal of this class is to provide a universal way to define gradients on a graphic. IMPORTANT ->>> So that if you scale the graphic the gradient will not look strange. <<<- IMPORTANT
 * EXAMPLE: let gradient:Gradient = Gradient([NSColor.blueColor().CGColor,NSColor.redColor().CGColor])
 * NOTE: NOTE: the radial scalar values can also be more or less than 0 and 1. think width * 1.2 etc. Works for both pos and size. (the only thing that is capped is the size if it goes under 0, then it is capped to 0)
 * NOTE: Radial gradient should maybe suport a dual system of focal and 2 point system (this dual support shoould not be provided by the Graphics class but rather the caller class)
 * NOTE: Linear and Radial should support both absolute and relative values that operate on the path boundingbox
 * TODO: Find that medium article on axial gradient. the one that looks like a "spread out patonefan"
 */
public class Gradient:IGradient {/*<---its public so that it works in playground*/
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>/*same as color stops*/
    public var rotation:CGFloat;/*must be between -π and π or it will fail*/
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [], _ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/){/*,*/
        self.colors = colors
        if (locations.count == 0/* && colors.count > 0*/) {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        self.rotation = rotation
    }
}

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


TODO: when you set the gradient points use absolute values, there is no need to use % values, you can doo all the GradientBox calculations in the Graphic instance etc, Keep Graphics simple. this is not true, you could update the path and not the gradient style and it should scale!
TODO: setup gradient tests for css,graphic framework, svg. all different gradients and offsets, everything should work. also matrix transformations etc
TODO: start by setting up a grid of Graphic framework gradients
TODO: then do the css gradient tests
TODO: then setup the svg gradients
TODO: then start refactoring the Graphics class related to the Gradient config methods etc, and start moving them into GradientGraphic etc.

*/

//Continue here: in order to move forward we need to seperate radial and linear gradient types. this class should provide the common denominator of the two possible three (concial gradient)

//Linear and Radial should support both absolute and relative values and also both boundingbox and ...or only bounding box? Think!
