import Cocoa

class TextFieldParser {
    /**
     * TODO: The paragraph style stuff doesnt seem to work. more research needed
     */
    static func font(_ fontName:String,_ size:CGFloat) -> NSFont{
        //let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()//NSMutableParagraphStyle.defaultParagraphStyle()
        //paragraphStyle.lineSpacing = 10.0//other paragraph options: paragraphSpacing,alignment,firstLineHeadIndent,lineBreakMode,minimumLineHeight,maximumLineHeight,baseWritingDirection,lineHeightMultiple,paragraphSpacingBefore
        let fontDescriptor:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontDescriptor.AttributeName.name:fontName/*,NSParagraphStyleAttributeName:paragraphStyle*/])//NSForegroundColorAttributeName:NSColor.redColor(),
        let font = NSFont(descriptor: fontDescriptor, size: size)
        return font!
    }
    static func alignment(_ alignType:String) -> NSTextAlignment{
        switch alignType{
            case "left":
                return NSTextAlignment.left
            case "right":
                return NSTextAlignment.right
            case "center":
                return NSTextAlignment.center
            case "justified":
                return NSTextAlignment.justified
            case "natural":
                return NSTextAlignment.natural
            default:
                fatalError("ALIGN TYPE NOT SUPPORTED: " + alignType)
        }
    }
}
