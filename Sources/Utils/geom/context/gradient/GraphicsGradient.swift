import Foundation
/**
 * This class is only used by Graphics
 * PARAM: transformation: we need transformation as this is the only way to achieve the squashed gradient look
 */
public struct GraphicsGradient:GraphicsGradientKind{
    public var cgGradient:CGGradient/*This value exists because of performance*/
    public var colors:[CGColor]
    public var locations:[CGFloat]/*Same as color stops*/
    public var transformation:CGAffineTransform?
    init(_ colors:[CGColor] = [], _ locations:[CGFloat] = [],_ transformation:CGAffineTransform? = nil){
        self.colors = colors
        let locs = locations.isEmpty ? CGFloatParser.interpolatedRange(0, 1, colors.count) : locations//TODO: ⚠️️ add support for nil aswell
        self.locations = locs
        self.transformation = transformation
        self.cgGradient = GradientUtils.cgGradient(colors,locs) ?? {fatalError("Unable to create cgGradient: colors: \(colors) locs: \(locs)")}()
    }
}
