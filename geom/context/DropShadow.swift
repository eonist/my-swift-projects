import Cocoa

class DropShadow {
    var color:NSColor
    var offsetX:CGFloat
    var offsetY:CGFloat
    var blurRadius:CGFloat
    init(_ color:NSColor,_ offsetX:CGFloat,_ offsetY:CGFloat,_ blurRadius:CGFloat){
        self.color = color
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
    }
}
/*
extension DropShadow{

}
*/