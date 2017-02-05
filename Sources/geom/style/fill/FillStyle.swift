import Cocoa
/**
 * TODO: Candidate for struct. Use IFillStyle as a base protocol
 */
class FillStyle:IFillStyle {
    var color:NSColor
    init(_ color:NSColor = NSColor.clear){
        self.color = color
    }
}