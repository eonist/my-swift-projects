import Cocoa

class TextFieldParser {
    /**
     * TODO: The paragraph style stuff doesnt seem to work. more research needed
     */
    static func font(_ fontName:String,_ size:CGFloat) -> NSFont{
        //let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()//NSMutableParagraphStyle.defaultParagraphStyle()
        //paragraphStyle.lineSpacing = 10.0//other paragraph options: paragraphSpacing,alignment,firstLineHeadIndent,lineBreakMode,minimumLineHeight,maximumLineHeight,baseWritingDirection,lineHeightMultiple,paragraphSpacingBefore
        let fontDescriptor:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontNameAttribute:fontName/*,NSParagraphStyleAttributeName:paragraphStyle*/])//NSForegroundColorAttributeName:NSColor.redColor(),
        let font = NSFont(descriptor: fontDescriptor, size: size)
        return font!
    }
    /**
     *
     */
    static func alignment(_ alignType:String) -> NSTextAlignment{
        let align:NSTextAlignment
        switch alignType{
        case "left":
            printin("one")
        case 3...8:
            printin("range from 3 to 8")
        default:
            break;
        }
        if(alignType == "left"){align = NSTextAlignment.left}
        else if(alignType == "right"){align = NSTextAlignment.right}
        else if(alignType == "center"){align = NSTextAlignment.center}
        else if(alignType == "justified"){align = NSTextAlignment.justified}
        else if(alignType == "natural"){align = NSTextAlignment.natural}
        else {fatalError("ALIGN TYPE NOT SUPPORTED: " + alignType)}
        return align
    }
}
