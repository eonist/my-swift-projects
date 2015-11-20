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
                case TextFormatConstants.background:return background
                case TextFormatConstants.backgroundColor:return backgroundColor
                case TextFormatConstants.selectable:return selectable
                case TextFormatConstants.textColor:return textColor
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
        set {
            switch key{
                case TextFormatConstants.background:background = newValue as! Bool
                case TextFormatConstants.backgroundColor:backgroundColor = newValue as! NSColor
                case TextFormatConstants.selectable:
                    Swift.print("newValue: " + "\(newValue)")
                    selectable = newValue as! Bool
                case TextFormatConstants.textColor:textColor = newValue as! NSColor
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
