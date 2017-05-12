import Cocoa

struct TextFormat {
    var background:Bool = false
    var backgroundColor:NSColor = NSColor.clear
    var selectable:Bool = false
    var color:NSColor = NSColor.gray
    var align:String = "left"//text.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
    var font:String = "Lucida Grande"
    var size:CGFloat = 12
    var type:String = "dynamic"/*input and static*/
    var border:Bool = false
    var multiline:Bool = false
    var wordWrap:Bool = true
    var scrollable:Bool = true
    var leading:CGFloat = NaN
    //TODO: autoSize can be implemented, check stackoverflow
}
/**
 * TODO: Use reflection instead of the bellow switch
 */
extension TextFormat{
    subscript(key: String) -> Any {
        get {
            switch TextFormatConstants(rawValue:key){
                case .background?:return background
                case .backgroundColor?:return backgroundColor
                case .selectable?:return selectable
                case .color?:return color
                case .align?:return align
                case .font?:return font
                case .size?:return size
                case .type?:return type
                case .border?:return border
                case .multiline?:return multiline
                case .wordWrap?:return wordWrap
                case .scrollable?:return scrollable
                case .leading?:return leading
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
        set {
            switch TextFormatConstants(rawValue:key){
                case .background?:background = newValue as! Bool
                case .backgroundColor?:backgroundColor = newValue as! NSColor
                case .selectable?:selectable = newValue as! Bool
                case .color?:color = newValue as! NSColor
                case .align?:align = newValue as! String
                case .font?:font = newValue is String ? newValue as! String : StringModifier.combine((newValue as! Array<Any>).map {String(describing:$0)}, " ")//This isnt pretty but it works, the problem is that Font names with 2 names gets parsed into an array of any in CSSPropertyParser
                case .size?:size = newValue as! CGFloat
                case .type?:type = newValue as! String
                case .border?:border = newValue as! Bool
                case .multiline?:multiline = newValue as! Bool
                case .wordWrap?:wordWrap = newValue as! Bool
                case .scrollable?:scrollable = newValue as! Bool
                case .leading?:leading = newValue as! CGFloat
                default:fatalError("UNSUPORTED TEXTFORMAT TYPE: " + key)
            }
        }
    }
    /**
     * NOTE: you can also set these: paragraphSpacing,alignment,lineBreakMode,minimumLineHeight,paragraphSpacingBefore
     */
    func attributedStringValue(_ stringValue:String) -> NSAttributedString{
        let font:NSFont = TextFieldParser.font(self.font,self.size)
        let textColor:NSColor = self.color
        let textParagraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        textParagraph.maximumLineHeight = self.leading.isNaN ? 0 : self.leading/*this sets the MAXIMUM height of the lines to 12points*/
        textParagraph.minimumLineHeight = textParagraph.maximumLineHeight
        textParagraph.alignment = TextFieldParser.alignment(self.align)//Left,Right,Justified,Natural,Center
        let attribs = [NSFontAttributeName:font,NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:textParagraph]
        let attrString:NSAttributedString = NSAttributedString.init(string: stringValue, attributes: attribs)
        return attrString
    }
}


/*

Research for implementing lineSpacing: (this task is completed ✅, but was pretty complicated, so keep these notes)

// text height is called line spacing in NsTextfield

//possible solution for the line-height problem: http://stackoverflow.com/questions/1958176/setting-the-line-height-line-spacing-in-an-nstextview

// this has the most complete answer: http://stackoverflow.com/questions/8356904/cocoa-nstextfield-line-spacing

NSMutableParagraphStyle * myStyle = [[NSMutableParagraphStyle alloc] init];
[myStyle setLineSpacing:10.0];
[myTextView setDefaultParagraphStyle:myStyle];


And

NSFont *bold14 = [NSFont boldSystemFontOfSize:14.0];
NSColor *textColor = [NSColor redColor];
NSMutableParagraphStyle *textParagraph = [[NSMutableParagraphStyle alloc] init];
[textParagraph setLineSpacing:10.0];

NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:bold14, NSFontAttributeName, textColor, NSForegroundColorAttributeName, textParagraph, NSParagraphStyleAttributeName, nil];
NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:title attributes:attrDic];
[self.titleField setAllowsEditingTextAttributes:YES];
[self.titleField setAttributedStringValue:attrString];

*/
