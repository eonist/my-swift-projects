import Cocoa

class DropShadow {
    var color:NSColor
    var offsetX:CGFloat
    var offsetY:CGFloat
    var blurRadius:CGFloat
    var inner:Bool
    init(_ color:NSColor,_ offsetX:CGFloat,_ offsetY:CGFloat,_ blurRadius:CGFloat,_ inner:Bool){
        self.color = color
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.inner = inner
    }
}
extension DropShadow:CustomStringConvertible{
    /**
     * For easier printing of the class variables
     */
    var description: String { get{return "Color: " + color.hex + "\n" + "offsetX: " + String(offsetX) + "\n" + "offsetY: " + String(offsetY)} }
}
