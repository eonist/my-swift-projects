import Cocoa
public enum GradientType:Int{//TODO:move to its own class?
    case Axial = 0, Radial//TODO: rename Axial to linear
}
/**
 * EXAMPLE: let gradient:Gradient = Gradient([NSColor.blueColor().CGColor,NSColor.redColor().CGColor])
 */
public class Gradient:IGradient{
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>
    public var gradientType:GradientType
    public var rotation:Double;/*this doesnt belong here, you apply rotations in the matrix*/
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Axial,_ rotation:Double = 4.71238898038469){/*,startPoint:CGPoint = CGPoint(),endPoint:CGPoint = CGPoint()*/
        self.colors = colors
        if locations.count == 0 {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        self.gradientType = gradientType
    }
}

