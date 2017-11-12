import Cocoa

extension TextFormat {
    struct Key {//TODO: ⚠️️ use static let instead, and use struct so you can create the names array via reflection
        static let selectable = "selectable"
        static let background = "background"
        static let backgroundColor = "backgroundColor"
        static let color = "color"
        static let align = "align"
        static let font = "font"
        static let size = "size"
        static let type = "type"/*static and input*/
        static let border = "border"
        static let multiline = "multiline"
        static let wordWrap = "wordWrap"
        static let scrollable = "scrollable"
        static let leading = "leading"/*line-spacing*/
        static let password = "password"
    }
}
extension TextFormat.Key{
    static let textFormatPropertyNames:[String] = {
        return [
            size,
            font,
            align,
            selectable,
            background,
            backgroundColor,
            color,
            type,
            border,
            multiline,
            wordWrap,
            scrollable,
            leading,
            password
        ]
    }()
}

/**
 * TODO: ⚠️️ Use reflection instead of the bellow switch
 */
extension TextFormat{
    subscript(key: String) -> Any {
        get {
            switch key{
            case Key.background:return background
            case Key.backgroundColor:return backgroundColor
            case Key.selectable:return selectable
            case Key.color:return color
            case Key.align:return align
            case Key.font:return font
            case Key.size:return size
            case Key.type:return type
            case Key.border:return border
            case Key.multiline:return multiline
            case Key.wordWrap:return wordWrap
            case Key.scrollable:return scrollable
            case Key.leading:return leading
            case Key.password:return password
            default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
        set {
            switch key{
            case Key.background:background = newValue as! Bool
            case Key.backgroundColor:backgroundColor = newValue as! NSColor
            case Key.selectable:selectable = newValue as! Bool
            case Key.color:color = newValue as! NSColor
            case Key.align:align = newValue as! String
            case Key.font:font = newValue is String ? newValue as! String : StringModifier.combine((newValue as! Array<Any>).map {String(describing:$0)}, " ")//This isnt pretty but it works, the problem is that Font names with 2 names gets parsed into an array of any in CSSPropertyParser
            case Key.size:size = newValue as! CGFloat
            case Key.type:type = newValue as! String
            case Key.border:border = newValue as! Bool
            case Key.multiline:multiline = newValue as! Bool
            case Key.wordWrap:wordWrap = newValue as! Bool
            case Key.scrollable:scrollable = newValue as! Bool
            case Key.leading:leading = newValue as! CGFloat
            case Key.password:password = newValue as! Bool
            default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
