import Cocoa

protocol FillStyleKind{
    var color:NSColor {get set}
}
/**
 * Convenience method for the Graphics class
 */
extension FillStyleKind {
    var cgColor:CGColor {return CGColorParser.cgColor(color)}
    func copy() -> FillStyleKind {
        return FillStyleParser.clone(self)
    }
}
