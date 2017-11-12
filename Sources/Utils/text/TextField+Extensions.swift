import Cocoa

extension TextField  {
    static func textField(textFormat:TextFormat) -> NSTextField{
        let textField:NSTextField = {
            if textFormat.password {return SecureTextField(frame: NSRect())}
            else {
                return TextField(frame: NSRect())
            }
        }()
        textField.allowsEditingTextAttributes = false//avoids mixed styles when copy past from other text styles
        return (textField)
    }
    /**
     * New
     */
    static func editableTextField(/*textFormat:TextFormat*/) -> NSTextField{
        let text = EditableTextField.init(frame: CGRect(0,0,100,100))//NSTextField.init(frame: CGRect(0,0,100,100))//
        
//        text.focusRingType = NSFocusRingType.none//<- implement suport for this if needed, Personally i don't like it. You can use the focus state instead and have your own focus style applied
//        text.isBordered = false//<--This doesn't work in Live Edit mode
//        text.isEditable = true
//        text.isSelectable = true
        
        
        var textFormat = TextFormat()
        textFormat.selectable = true
        textFormat.type = "input"
        textFormat.size = 22
        textFormat.color = .green
        TextFieldModifier.applyTextFormat(text,textFormat)
//        let font:NSFont = TextFieldParser.font("Lucida Grande",22)
//        let textParagraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
//        textParagraph.maximumLineHeight = 0/*this sets the MAXIMUM height of the lines to 12points*/
//        textParagraph.minimumLineHeight = textParagraph.maximumLineHeight
//        textParagraph.alignment = TextFieldParser.alignment("left")//Left,Right,Justified,Natural,Center
        
        let temp = TextFormatUtils.attributedStringValue(stringValue:"hello world",textFormat:textFormat)
        
        
//        let attribs:[NSAttributedStringKey : Any] = [NSAttributedStringKey.font:font,NSAttributedStringKey.foregroundColor:NSColor.green,NSAttributedStringKey.paragraphStyle:textParagraph]//,NSAttributedStringKey.paragraphStyle:textParagraph
//        let attrString:NSAttributedString = NSAttributedString.init(string: "hello world", attributes: attribs)
//        text.allowsEditingTextAttributes = true //this is imp, or else textfield defaults back to default textforat in edit mode
//        text.attributedStringValue = attrString
        text.attributedStringValue = temp
        text.sizeToFit()
        
        return text
    }
}
class EditableTextField:NSTextField/*,Trackable*/{
    var trackingArea:NSTrackingArea?
//    override func viewWillDraw() {
//        self.becomeFirstResponder()
//    }
    /**
     * NOTE: You must use InteractiveView as a parent for this class to work
     * NOTE: the hitTesting bellow is the only combination I found that will give a correct hit.
     */
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        let retVal = super.hitTest(CGPoint(localPos().x,localPos().y))
        return retVal
    }
}
