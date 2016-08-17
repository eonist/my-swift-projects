import Cocoa

class TextFieldParser {
    /**
     * TODO: The paragraph style stuff doesnt seem to work. more research needed
     */
    class func font(fontName:String,_ size:CGFloat) -> NSFont{
        //let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()//NSMutableParagraphStyle.defaultParagraphStyle()
        //paragraphStyle.lineSpacing = 10.0//other paragraph options: paragraphSpacing,alignment,firstLineHeadIndent,lineBreakMode,minimumLineHeight,maximumLineHeight,baseWritingDirection,lineHeightMultiple,paragraphSpacingBefore
        let fontDescriptor:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontNameAttribute:fontName/*,NSParagraphStyleAttributeName:paragraphStyle*/])//NSForegroundColorAttributeName:NSColor.redColor(),
        let font = NSFont(descriptor: fontDescriptor, size: size)
        return font!
    }
    /**
     *
     */
    class func alignment(alignType:String) -> NSTextAlignment{
        let align:NSTextAlignment
        if(alignType == "left"){align = NSTextAlignment.Left}
        else if(alignType == "right"){align = NSTextAlignment.Right}
        else if(alignType == "center"){align = NSTextAlignment.Center}
        else if(alignType == "justified"){align = NSTextAlignment.Justified}
        else if(alignType == "natural"){align = NSTextAlignment.Natural}
        else {fatalError("ALIGN TYPE NOT SUPPORTED: " + alignType)}
        return align
    }
}
