import Cocoa

class TextFieldModifier {
    /**
     * TODO: Border color?
     */
    static func applyTextFormat(_ textField:TextField,_ textFormat:TextFormat){
        textField.allowsEditingTextAttributes = true/*enables line-spacing and other textAttributes*/
        textField.isSelectable = textFormat.selectable
        textField.backgroundColor = textFormat.background ? textFormat.backgroundColor : NSColor.clear
        //Swift.print("textField.backgroundColor: " + "\(textField.backgroundColor)")
        textField.drawsBackground = true//textFormat.background//<--this is a temp fix so that one can add or remove a background while the app is running, this should ideally be done automatically when the text is re-rendered, more research needed
        //textField.alignment = TextFieldParser.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        //textField.textColor = textFormat.color
        //textField.font = TextFieldParser.font(textFormat.font,textFormat.size)
        textField.isEditable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.none//<- implement suport for this if needed, Personally i dont like it. You can use the focus state instead and have your own focus style applied
        textField.isBordered = textFormat.border//<--This doesn't work in Live Edit mode
        //textField.maximumNumberOfLines = 1//<---cant get these to work yet
        textField.usesSingleLineMode = !textFormat.multiline//<---can't get these to work yet, works now in multiline textfields
        let leadingYOffset:CGFloat = textFormat.leading.isNaN ? 0 : textFormat.size - textFormat.leading
        textField.bounds.origin += CGPoint(0,leadingYOffset)
        //textField.lineBreakMode = .ByWordWrapping
        //Swift.print("textFormat.wordWrap: " + "\(textFormat.wordWrap)")
        textField.cell?.wraps = textFormat.wordWrap//wordwrap enables the text to be in one line basically, this could probably be set when setting the paragraphstyle
        //if(textFormat.multiline) {textField.setContentCompressionResistancePriority(50, forOrientation: .Horizontal)}//this is for auto-layout only i think
        textField.cell?.isScrollable = textFormat.scrollable/*If true then you can scroll sideways. (I guess this is connected to wordWrap as well)*/
    }
    /**
     * Beta
     */
    static func size(_ textField:TextField,_ width:CGFloat,_ height:CGFloat) {
        textField.frame.w = width/*SkinParser.width(this);*/
        textField.frame.h = height/*SkinParser.height(this);*/
        //textField.setTextFormat(StylePropertyParser.textFormat(this));
    }
}
