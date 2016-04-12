import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:TextField,_ textFormat:TextFormat){
        textField.selectable = textFormat.selectable
        
        textField.backgroundColor = textFormat.background ? textFormat.backgroundColor : NSColor.clearColor()
        textField.drawsBackground = true//textFormat.background//<--this is a temp fix so that one can add or remove a background while the app is running, this should ideally be done automatically when the text is re-rendered, more research needed
        
        textField.alignment = Utils.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        textField.textColor = textFormat.color
        textField.font = Utils.font(textFormat.font,textFormat.size)
        textField.editable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.None//<- implement suport for this if needed, Personally i dont like it. You can use the focus state instead and have your own focus style applied
        textField.bordered = textFormat.border//<--maybe implement later
        //textField.maximumNumberOfLines = 1//<---cant get these to work yet
        textField.usesSingleLineMode = !textFormat.multiline//<---cant get these to work yet, works now in multiline textfields
        //textField.lineBreakMode = .ByWordWrapping
        //Swift.print("textFormat.wordWrap: " + "\(textFormat.wordWrap)")
        textField.cell?.wraps = textFormat.wordWrap//wordwrap enables the text to be in one line basically
        //if(textFormat.multiline) {textField.setContentCompressionResistancePriority(50, forOrientation: .Horizontal)}//this is for auto-layout only i think

        textField.cell?.scrollable = textFormat.scrollable//i guess this is connected to wordWrap
    }
    /**
     * Beta
     */
    class func size(textField:TextField,_ width:CGFloat,_ height:CGFloat) {
        textField.frame.width = width;/*SkinParser.width(this);*/
        textField.frame.height = height;/*SkinParser.height(this);*/
        //textField.setTextFormat(StylePropertyParser.textFormat(this));
    }
}
private class Utils{
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