import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:NSText,_ textFormat:TextFormat){
        textField.selectable = false
        textField.drawsBackground = true
        textField.backgroundColor = NSColor.purpleColor()
        NSTextAlignment.
        textField.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
        textField.textColor = NSColor.orangeColor()
    }
}
