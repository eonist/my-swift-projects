import Cocoa
/**
 * TODO: Candidate for struct. Use IFillStyle as a base protocol
 */
class FillStyle:FillStyleKind {
    var color:NSColor
    init(_ color:NSColor = .clear){
        self.color = color
    }
}
