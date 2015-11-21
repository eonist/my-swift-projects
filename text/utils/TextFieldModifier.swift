import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:NSText,_ textFormat:TextFormat){
        textField.selectable = textFormat.selectable
        textField.drawsBackground = textFormat.background
        textField.backgroundColor = textFormat.backgroundColor
        textField.alignment = Utils.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        textField.textColor = NSColor.orangeColor()
        let timesRoman:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontNameAttribute:"Times-Roman"])//NSForegroundColorAttributeName:NSColor.redColor(),
        

        let font = NSFont(descriptor: timesRoman, size: 22)
        text.font = helveticaBoldFont
        //do font and size
    }
}
private class Utils{
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