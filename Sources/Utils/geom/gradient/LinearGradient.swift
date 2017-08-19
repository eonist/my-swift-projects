import Foundation
/**
 * NOTE: There is no TopLeft or BottomRight etc in the CSS sepcs so no need to have more complex relative positioning in this class
 * TODO: ⚠️️ Why do we have this class when its basically the same as Gradient? Because the alternative is to ad another value to to Gradient to represent Gradient Type.
 */
typealias LinearGradient = Gradient

extension LinearGradient:UnWrappable{
    static func unWrap<T>(_ xml:XML) -> T? {
        let colors:[CGColor?] = unWrap(xml, "colors")
        let locations:[CGFloat?] = unWrap(xml, "locations")
        let rotation:CGFloat = unWrap(xml, "rotation")!
        let transformation:CGTransform? = unWrap(xml, "transformation")
        return LinearGradient(colors.flatMap{$0}, locations.flatMap{$0}, rotation, transformation) as? T
    }
}

extension LinearGradient{
    init(_ gradient:GradientKind){
        self.init(gradient.colors,gradient.locations,gradient.rotation)
    }
}
