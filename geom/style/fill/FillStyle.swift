import Cocoa

class FillStyle:IFillStyle {
    var color:NSColor
    init(_ color:NSColor = NSColor.clear){
        self.color = color
    }
}