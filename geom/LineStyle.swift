import Cocoa
protocol ILineStyle {
    var color: NSColor { get set }
}
class LineStyle :ILineStyle{
    var color:NSColor
    var borderWidth:Int
    /**
    *
    */
    init(_ borderWidth:Int = 0,_ color:NSColor = NSColor.clearColor()){
        self.borderWidth = borderWidth
        self.color = color
    }
}
extension LineStyle {
    var cgColor: CGColor {return NSColorParser.cgColor(color)}
}