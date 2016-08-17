import Cocoa

class TextFormat {
    var background:Bool = false
    var backgroundColor:NSColor = NSColor.clearColor()
    var selectable:Bool = false
    var color:NSColor = NSColor.grayColor()
    var align:String = "left"//text.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
    var font:String = "Lucida Grande"
    var size:CGFloat = 12
    var type:String = "dynamic"//input and static
    var border:Bool = false
    var multiline:Bool = false
    var wordWrap:Bool = true
    var scrollable:Bool = true
    var leading:CGFloat = 10
    //autoSize can be implemented, check stackoverflow
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
                case TextFormatConstants.border:return border
                case TextFormatConstants.multiline:return multiline
                case TextFormatConstants.wordWrap:return wordWrap
                case TextFormatConstants.scrollable:return scrollable
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
                case TextFormatConstants.type:type = newValue as! String
                case TextFormatConstants.border:border = newValue as! Bool
                case TextFormatConstants.multiline:multiline = newValue as! Bool
                case TextFormatConstants.wordWrap:wordWrap = newValue as! Bool
                case TextFormatConstants.scrollable:scrollable = newValue as! Bool
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}