import Cocoa
// text height is called line spacing in NsTextfield

//possible solution for the line-height problem: http://stackoverflow.com/questions/1958176/setting-the-line-height-line-spacing-in-an-nstextview

// this has the most complete answer: http://stackoverflow.com/questions/8356904/cocoa-nstextfield-line-spacing
/*


NSMutableParagraphStyle * myStyle = [[NSMutableParagraphStyle alloc] init];
[myStyle setLineSpacing:10.0];
[myTextView setDefaultParagraphStyle:myStyle];


And

NSFont *bold14 = [NSFont boldSystemFontOfSize:14.0];
NSColor *textColor = [NSColor redColor];
NSMutableParagraphStyle *textParagraph = [[NSMutableParagraphStyle alloc] init];
[textParagraph setLineSpacing:10.0];

NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:bold14, NSFontAttributeName, textColor, NSForegroundColorAttributeName, textParagraph, NSParagraphStyleAttributeName, nil];
NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:title attributes:attrDic]; 
[self.titleField setAllowsEditingTextAttributes:YES];
[self.titleField setAttributedStringValue:attrString];

*/

//
class TextFieldModifier {
    /**
     * TODO: Border color?
     */
    class func applyTextFormat(textField:TextField,_ textFormat:TextFormat){
        
        
        //Swift.print("attrString: " + "\(attrString)")
        textField.allowsEditingTextAttributes = true/*enables line-spacing and other textAttributes*/
        textField.selectable = textFormat.selectable
        textField.backgroundColor = textFormat.background ? textFormat.backgroundColor : NSColor.clearColor()
        textField.drawsBackground = true//textFormat.background//<--this is a temp fix so that one can add or remove a background while the app is running, this should ideally be done automatically when the text is re-rendered, more research needed

        //textField.alignment = TextFieldParser.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        //textField.textColor = textFormat.color
        //textField.font = TextFieldParser.font(textFormat.font,textFormat.size)
        textField.editable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.None//<- implement suport for this if needed, Personally i dont like it. You can use the focus state instead and have your own focus style applied
        textField.bordered = textFormat.border//<--This doesnt work i Live Edit mode
        //textField.maximumNumberOfLines = 1//<---cant get these to work yet
        textField.usesSingleLineMode = !textFormat.multiline//<---can't get these to work yet, works now in multiline textfields
        let leadingYOffset:CGFloat = textFormat.leading.isNaN ? 0 : textFormat.size - textFormat.leading
        textField.bounds.origin += CGPoint(0,leadingYOffset)
        //textField.lineBreakMode = .ByWordWrapping
        //Swift.print("textFormat.wordWrap: " + "\(textFormat.wordWrap)")
        textField.cell?.wraps = textFormat.wordWrap//wordwrap enables the text to be in one line basically, this could probably be set when setting the paragraphstyle
        //if(textFormat.multiline) {textField.setContentCompressionResistancePriority(50, forOrientation: .Horizontal)}//this is for auto-layout only i think
        textField.cell?.scrollable = textFormat.scrollable//i guess this is connected to wordWrap
        textField
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