import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:NSText,_ textFormat:TextFormat){
        textField.selectable = textFormat.selectable
        textField.drawsBackground = textFormat.background
        textField.backgroundColor = textFormat.backgroundColor
        textField.alignment = Utils.alignment(textFormat)//Left,Right,Justified,Natural,Center
        textField.textColor = NSColor.orangeColor()
    }
}
private class Utils{
    /**
     *
     */
    class func alignment(textFormat:TextFormat) -> NSTextAlignment{
        let align:NSTextAlignment
        if(textFormat.align == "left"){align = NSTextAlignment.Left}
        else if(textFormat.align == "right"){align = NSTextAlignment.Right}
        else if(textFormat.align == "center"){align = NSTextAlignment.Center}
        else if(textFormat.align == "justified"){align = NSTextAlignment.Justified}
        else if(textFormat.align == "Natural"){align = NSTextAlignment.Natural}
        return align
    }
}