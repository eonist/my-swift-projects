import Cocoa

typealias IFillStyle = FillStyleKind/*Legacy support*/
protocol FillStyleKind{
    var color:NSColor {get set}
}
/**
 * Convenience method for the Graphics class
 */
extension FillStyleKind {
    var cgColor:CGColor {return CGColorParser.cgColor(color)}
    func copy() -> IFillStyle {
        return FillStyleParser.clone(self)
    }
}
