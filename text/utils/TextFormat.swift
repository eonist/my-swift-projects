import Cocoa

class TextFormat {
    var background:Bool = false;
    var backgroundColor:NSColor = NSColor.clearColor()
    var selectable:Bool = false
    var color:NSColor = NSColor.grayColor()
    var align:String = "left"//text.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
    var font:String = "Lucida Grande"
    var size:CGFloat = 12
    init(){
        
    }
    subscript(key: String) -> Any {
        get {
            switch key{
                case TextFormatConstants.background:return background
                case TextFormatConstants.backgroundColor:return backgroundColor
                case TextFormatConstants.selectable:return selectable
                case TextFormatConstants.color:return color
                case TextFormatConstants.align:return align
                case TextFormatConstants.font:return font
                case TextFormatConstants.size:return size
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
        set {
            //Swift.print("TextFormat.set() newValue: " + "\(newValue)")
            switch key{
                case TextFormatConstants.background:background = newValue as! Bool
                case TextFormatConstants.backgroundColor:backgroundColor = newValue as! NSColor
                case TextFormatConstants.selectable:selectable = newValue as! Bool
                case TextFormatConstants.color:
                    Swift.print("Setting color: ")
                    color = newValue as! NSColor
                case TextFormatConstants.align:align = newValue as! String
                case TextFormatConstants.font:font = newValue as! String
                case TextFormatConstants.size:size = newValue as! CGFloat
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
