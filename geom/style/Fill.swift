import Cocoa
/**
 * I think this can be DEPRECATED
 */
protocol IFill {
    var color: NSColor { get set }
}
class Fill :IFill{
    static var clear:IFill = Fill(NSColor.clearColor())
    var color:NSColor
    /**
    *
    */
    init(_ color:NSColor = NSColor.clearColor()){
        self.color = color
    }
}

extension IFill {
    var cgColor: CGColor {return CGColorParser.cgColor(color)}
}