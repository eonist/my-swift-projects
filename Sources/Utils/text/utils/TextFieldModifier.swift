import Cocoa

class TextFieldModifier {
    /**
     * TODO: Border color?
     */
    static func applyTextFormat(_ textField:NSTextField,_ textFormat:TextFormat){
//        Swift.print("TextFieldModifier.applyTextFormat")
        textField.allowsEditingTextAttributes = true/*enables line-spacing and other textAttributes,this is imp, or else textfield defaults back to default textforat in edit mode*/
        textField.isSelectable = textFormat.selectable
        textField.backgroundColor = textFormat.background ? textFormat.backgroundColor : NSColor.clear
        //Swift.print("textField.backgroundColor: " + "\(textField.backgroundColor)")
        textField.drawsBackground = true//textFormat.background//<--this is a temp fix so that one can add or remove a background while the app is running, this should ideally be done automatically when the text is re-rendered, more research needed
        //textField.alignment = TextFieldParser.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        //textField.textColor = textFormat.color
        //textField.font = TextFieldParser.font(textFormat.font,textFormat.size)
        textField.isEditable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.none//<- implement suport for this if needed, Personally i don't like it. You can use the focus state instead and have your own focus style applied
        textField.isBordered = textFormat.border//<--This doesn't work in Live Edit mode
        //textField.maximumNumberOfLines = 1//<---can't get these to work yet
        textField.usesSingleLineMode = !textFormat.multiline//<---can't get these to work yet, works now in multiline textfields
//        Swift.print("textFormat.leading: " + "\(textFormat.leading)")
        let leadingYOffset:CGFloat = textFormat.leading.isNaN ? 0 : textFormat.size - textFormat.leading
//        Swift.print("leadingYOffset: " + "\(leadingYOffset)")
        textField.bounds.origin += CGPoint(0,leadingYOffset)
//        Swift.print("textField.bounds.origin: " + "\(textField.bounds.origin)")
        //textField.lineBreakMode = .ByWordWrapping
        //Swift.print("textFormat.wordWrap: " + "\(textFormat.wordWrap)")
        textField.cell?.wraps = textFormat.wordWrap//wordwrap enables the text to be in one line basically, this could probably be set when setting the paragraphstyle
        //if(textFormat.multiline) {textField.setContentCompressionResistancePriority(50, forOrientation: .Horizontal)}//this is for auto-layout only i think
        textField.cell?.isScrollable = textFormat.scrollable/*If true then you can scroll sideways. (I guess this is connected to wordWrap as well)*/
        textField.usesSingleLineMode = false//new, might break things
    }
    /**
     * Beta
     */
//    static func size(_ textField:NSTextField,_ width:CGFloat,_ height:CGFloat) {
////        Swift.print("TextFieldModifier.size.width: " + "\(width)")
//            
//        /*)
//         Swift.print("textField.superview?.frame.width: " + "\(textField.superview?.frame.width)")
//         Swift.print("textField.superview?.superview?.frame.width: " + "\(textField.superview?.superview?.frame.width)")*/
//        textField.frame.w = width/*SkinParser.width(this);*/
//        textField.frame.h = height/*SkinParser.height(this);*/
//        //textField.setTextFormat(StylePropertyParser.textFormat(this));
//    }
    /**
     * NOTE: Use self.selectText(self) to select all text
     */
    func setTextSelection(_ textField:NSTextField, _ start:Int,_ end:Int){
        textField.currentEditor()?.selectedRange = NSRange(location: 0,length: 10)
    }
}
