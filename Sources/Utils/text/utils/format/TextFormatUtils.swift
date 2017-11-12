import Cocoa

class TextFormatUtils {
    /**
     * NOTE: you can also set these: paragraphSpacing,alignment,lineBreakMode,minimumLineHeight,paragraphSpacingBefore
     */
    static func attributedStringValue(stringValue:String, textFormat:TextFormat) -> NSAttributedString{
        let font:NSFont = TextFieldParser.font(textFormat.font,textFormat.size)
        let textColor:NSColor = textFormat.color
        let textParagraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        textParagraph.maximumLineHeight = textFormat.leading.isNaN ? 0 : textFormat.leading/*this sets the MAXIMUM height of the lines to 12points*/
        //        Swift.print("textParagraph.maximumLineHeight: " + "\(textParagraph.maximumLineHeight)")
        textParagraph.minimumLineHeight = textParagraph.maximumLineHeight
        //        Swift.print("textParagraph.minimumLineHeight: " + "\(textParagraph.minimumLineHeight)")
        textParagraph.alignment = TextFieldParser.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        let attribs:[NSAttributedStringKey : Any] = [NSAttributedStringKey.font:font,NSAttributedStringKey.foregroundColor:textColor,NSAttributedStringKey.paragraphStyle:textParagraph]
        let attrString:NSAttributedString = NSAttributedString.init(string: stringValue, attributes: attribs)
        
        return attrString
    }
}
