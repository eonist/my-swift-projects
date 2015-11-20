import Cocoa

class TextFormat {
    var background:Bool = false;
    var backgroundColor:NSColor = NSColor.clearColor()
    var selectable:Bool = false
    var textColor:NSColor = NSColor.blackColor()
    init(){
        
    }
    subscript(key: String) -> Any {
        get {
            switch key{
                case "background":return background
                case "backgroundColor":return backgroundColor
                case "selectable":return selectable
                case "textColor":return textColor
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
        set {
            switch key{
                case "background":background = newValue as! Bool
                case "backgroundColor":backgroundColor = newValue as! NSColor
                case "selectable":return selectable = newValue as! Bool
                case "textColor":return textColor = newValue as! NSColor
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
