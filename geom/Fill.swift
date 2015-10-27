import Cocoa
protocol IFill {
    var color: NSColor { get set }
}
class Fill :IFill{
    var color:NSColor
    /**
    *
    */
    init(_ color:NSColor){
        self.color = color
    }
}

extension Fill {
    var cgColor: CGColor {return NSColorParser.cgColor(color)}
}