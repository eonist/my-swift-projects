import Cocoa
public enum GradientType:Int{
    case Axial = 0, Radial//rename Axial to linear
}
public class Gradient{
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>
    public var gradientType:GradientType
    public init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ gradientType:GradientType = GradientType.Axial){/*,startPoint:CGPoint = CGPoint(),endPoint:CGPoint = CGPoint()*/
        self.colors = colors
        if locations.count == 0 {//add support for nil aswell
            Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        self.gradientType = gradientType
    }
}

