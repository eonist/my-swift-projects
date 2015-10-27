import Cocoa
protocol IStroke {
    var color: NSColor { get set }
    var width: CGFloat { get set }
    func testing()
}
class Stroke :IStroke{
    static var clear:IStroke = Stroke(0,NSColor.clearColor())
    var color:NSColor
    var width:CGFloat
    /**
    *
    */
    init(_ width:CGFloat = 0,_ color:NSColor = NSColor.clearColor()){
        self.width = width
        self.color = color
    }
    /**
    *
    */
    func testing(){
        print("from class")
    }
}
extension IStroke {
    var cgColor: CGColor {return NSColorParser.cgColor(color)}
    /**
    *
    */
    func testing(){
        print("from extension")
    }
    
}
