import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:TextField,_ textFormat:TextFormat){
        textField.selectable = textFormat.selectable
        textField.drawsBackground = textFormat.background
        textField.backgroundColor = textFormat.backgroundColor

        textField.alignment = Utils.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        textField.textColor = textFormat.color
        textField.font = Utils.font(textFormat.font,textFormat.size)
        textField.editable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.None//<- implement suport for this if needed, Personally i dont like it. You can use the focus state instead and have your own focus style applied
        textField.bordered = textFormat.border//<--maybe implement later
        //textField.maximumNumberOfLines = 1//<---cant get these to work yet
        textField.usesSingleLineMode = false//<---cant get these to work yet
        //textField.lineBreakMode = .ByWordWrapping
        
        textField.cell?.wraps = true//textFormat.wordWrap//wordwrap enables the text to be in one line basically
        if(textFormat.multiline) {textField.setContentCompressionResistancePriority(250, forOrientation: .Horizontal)}

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
     *
     */
    class func font(fontName:String,_ size:CGFloat) -> NSFont{
        let fontDescriptor:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontNameAttribute:fontName])//NSForegroundColorAttributeName:NSColor.redColor(),
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