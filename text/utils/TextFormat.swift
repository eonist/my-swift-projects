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
    var leading:CGFloat = NaN
    //autoSize can be implemented, check stackoverflow
    init(){}
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
                case TextFormatConstants.leading:return leading
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
                case TextFormatConstants.leading:leading = newValue as! CGFloat
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
}
extension TextFormat{
    /**
     * NOTE: you can also set these: paragraphSpacing,alignment,lineBreakMode,minimumLineHeight,paragraphSpacingBefore
     */
    func attributedStringValue(stringValue:String) -> NSAttributedString{
        let font:NSFont = TextFieldParser.font(self.font,self.size)
        let textColor:NSColor = self.color
        let textParagraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        
        if(self.leading == 8){
            textParagraph.maximumLineHeight = self.leading/*this sets the MAXIMUM height of the lines to 12points*/
            textParagraph.minimumLineHeight = self.leading
            Swift.print("textParagraph.allowsDefaultTighteningForTruncation: " + "\(textParagraph.allowsDefaultTighteningForTruncation)")
            //textParagraph.allowsDefaultTighteningForTruncation = false
            //textParagraph.lineBreakMode = NSLineBreakMode.
            textParagraph.lineSpacing = 0//self.leading/*this sets the space BETWEEN lines to 10points*/
            //textParagraph.paragraphSpacing = 25
            //textParagraph.paragraphSpacingBefore = 20
//            textParagraph.hyphenationFactor
            //textParagraph.lineHeightMultiple = 2
            //textParagraph.headIndent = 20
            //textParagraph.
            Swift.print("textParagraph.maximumLineHeight: " + "\(textParagraph.maximumLineHeight)")
            Swift.print("textParagraph.minimumLineHeight: " + "\(textParagraph.minimumLineHeight)")
        }else{
            Swift.print("textParagraph.lineSpacing: " + "\(textParagraph.lineSpacing)")
            Swift.print("textParagraph.maximumLineHeight: " + "\(textParagraph.maximumLineHeight)")
            Swift.print("textParagraph.minimumLineHeight: " + "\(textParagraph.minimumLineHeight)")
        }
       
        textParagraph.alignment = TextFieldParser.alignment(self.align)//Left,Right,Justified,Natural,Center
        

        //textParagraph.minimumLineHeight = 1.0
        let attribs = [NSFontAttributeName:font,NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:textParagraph]
        let attrString:NSAttributedString = NSAttributedString.init(string: stringValue, attributes: attribs)
        return attrString
    }
}