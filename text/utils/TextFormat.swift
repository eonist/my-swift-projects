import Cocoa

class TextFormat {
    var background:Bool = false;
    var backgroundColor:NSColor = NSColor.clearColor()
    var selectable:Bool = false
    var color:NSColor = NSColor.grayColor()
    var align:String = "left"//text.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
    var font:String = "Lucida Grande"
    var size:CGFloat = 12
    var type:CGFloat = ""
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
                case TextFormatConstants.type:return type
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
                    //Swift.print("Setting color: ")
                    color = newValue as! NSColor
                case TextFormatConstants.align:align = newValue as! String
            case TextFormatConstants.font:font = newValue is String ? newValue as! String : StringModifier.combine((newValue as! Array<Any>).map {String($0)}, " ")//This isnt pretty but it works, the problem is that Font names with 2 names gets parsed into an array of any in CSSPropertyParser
                case TextFormatConstants.size:size = newValue as! CGFloat
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
