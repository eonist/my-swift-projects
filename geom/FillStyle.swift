import Cocoa
protocol IFillStyle {
    var color: NSColor { get set }
}
class FillStyle :IFillStyle{
    var color:NSColor
    /**
    *
    */
    init(color:NSColor){
        self.color = color
    }
}

