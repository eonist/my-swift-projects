import Foundation
/**
 * Radial gradient should maybe suport a dual system of focal and 2 point system (this dual support shoould not be provided by the Graphics class but rather the caller class)
 * Linear and Radial should support both absolute and relative values that operate on the path boundingbox
 */
public class Gradient2:IGradient2 {/*<---its public so that it works in playground*/
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>/*same as color stops*/
    public var transformation:CGAffineTransform?
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Linear,_ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/,_ relativeStartCenter:CGPoint? = nil,_ relativeEndCenter:CGPoint? = nil,_ relativeStartRadius:CGSize? = nil,_ relativeEndRadius:CGSize? = nil, _ p1:CGPoint? = nil, _ p2:CGPoint? = nil,_ useBoundingBox:Bool = false, _ transformation:CGAffineTransform? = nil){/*,*/
        self.colors = colors
        if (locations.count == 0/* && colors.count > 0*/) {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        self.transformation = transformation
    }
}
