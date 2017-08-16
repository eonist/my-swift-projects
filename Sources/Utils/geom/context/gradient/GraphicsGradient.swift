import Foundation
/**
 * PARAM: transformation: we need transformation as this is the only way to achieve the squashed gradient look
 * TODO: ⚠️️ Convert to struct, then use decoration to add linear and radial
 */
public class GraphicsGradient:GraphicsGradientKind{
    public var colors:[CGColor]
    public var locations:[CGFloat]/*same as color stops*/
    public var transformation:CGAffineTransform?
    init(_ colors:[CGColor] = [], _ locations:[CGFloat] = [],_ transformation:CGAffineTransform? = nil){
        self.colors = colors
        if (locations.count == 0) {//TODO: add support for nil aswell
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
        }else{
            self.locations = locations
        }
        self.transformation = transformation
    }
}
