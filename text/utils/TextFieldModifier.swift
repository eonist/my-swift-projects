import Cocoa

class TextFieldModifier {
    /**
     *
     */
    class func applyTextFormat(textField:NSText,_ textFormat:TextFormat){
        textField.selectable = textFormat.selectable
        textField.drawsBackground = textFormat.background
        textField.backgroundColor = textFormat.backgroundColor
        let align:NSTextAlignment
        if(){
        textField.alignment = (textFormat.align)//Left,Right,Justified,Natural,Center
        textField.textColor = NSColor.orangeColor()
    }
}
