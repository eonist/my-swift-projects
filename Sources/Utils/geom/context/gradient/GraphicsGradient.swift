import Foundation
/**
 * PARAM: transformation: we need transformation as this is the only way to achieve the squashed gradient look
 */
public struct GraphicsGradient:GraphicsGradientKind{
    public var colors:[CGColor]
    public var locations:[CGFloat]/*Same as color stops*/
    public var transformation:CGAffineTransform?
    init(_ colors:[CGColor] = [], _ locations:[CGFloat] = [],_ transformation:CGAffineTransform? = nil){
        self.colors = colors
        self.locations = locations.isEmpty ? CGFloatParser.interpolatedRange(0,  1,  colors.count) : locations//TODO: add support for nil aswell
        self.transformation = transformation
    }
}
