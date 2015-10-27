import Cocoa
protocol IStroke {
    var color: NSColor { get set }
}
class Stroke :IStroke{
    static var clear:IStroke = Stroke(0,NSColor.clearColor())
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
extension Stroke {
    var cgColor: CGColor {return NSColorParser.cgColor(color)}
}
