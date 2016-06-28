import Foundation
/**
 * @param: transformation: we need transformation as this is the only way to achieve the squashed gradient look
 */
public class GraphicsGradient:IGraphicsGradient{
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>/*same as color stops*/
    public var transformation:CGAffineTransform?
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ transformation:CGAffineTransform? = nil){
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