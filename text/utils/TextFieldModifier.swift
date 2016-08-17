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
        
        
        /*
        NSString *title = @"title here";
        NSFont *bold14 = [NSFont boldSystemFontOfSize:14.0];
        NSColor *textColor = [NSColor redColor];
        NSMutableParagraphStyle *textParagraph = [[NSMutableParagraphStyle alloc] init];
        [textParagraph setLineSpacing:10.0];  // this sets the space BETWEEN lines to 10points
        [textParagraph setMaximumLineHeight:12.0]; this sets the MAXIMUM height of the lines to 12points
        
        NSDictionary *attrDic = [NSDictionary dictionaryWithObjectsAndKeys:bold14, NSFontAttributeName, textColor, NSForegroundColorAttributeName, textParagraph, NSParagraphStyleAttributeName, nil];
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:title attributes:attrDic];
        [self.titleField setAllowsEditingTextAttributes:YES];
        [self.titleField setAttributedStringValue:attrString];
        */
        
        let title:String = "title here"
        let bold14:NSFont = NSFont.boldSystemFontOfSize(14.0)
        let textColor:NSColor = NSColor.redColor()
        let textParagraph:NSMutableParagraphStyle = NSMutableParagraphStyle()
        textParagraph.lineSpacing = 10.0/*this sets the space BETWEEN lines to 10points*/
        textParagraph.maximumLineHeight = 12.0/*this sets the MAXIMUM height of the lines to 12points*/
        let attribs = [NSFontAttributeName:bold14,NSForegroundColorAttributeName:textColor,NSParagraphStyleAttributeName:textParagraph]
        let attrString:NSAttributedString = NSAttributedString.init(string: title, attributes: attribs)
        
        //Swift.print("attrString: " + "\(attrString)")
        textField.allowsEditingTextAttributes = true
        //textField.attributedStringValue =
        Swift.print("textField.attributedStringValue: " + "\(textField.attributedStringValue)")
        Swift.print("textField.attributeKeys: " + "\(textField.attributeKeys)")
        
        textField.selectable = textFormat.selectable
        textField.backgroundColor = textFormat.background ? textFormat.backgroundColor : NSColor.clearColor()
        textField.drawsBackground = true//textFormat.background//<--this is a temp fix so that one can add or remove a background while the app is running, this should ideally be done automatically when the text is re-rendered, more research needed
        textField.alignment = Utils.alignment(textFormat.align)//Left,Right,Justified,Natural,Center
        textField.textColor = textFormat.color
        textField.font = Utils.font(textFormat.font,textFormat.size)
        textField.editable = textFormat.type == "input"
        textField.focusRingType = NSFocusRingType.None//<- implement suport for this if needed, Personally i dont like it. You can use the focus state instead and have your own focus style applied
        textField.bordered = textFormat.border//<--This doesnt work i Live Edit mode
        //textField.maximumNumberOfLines = 1//<---cant get these to work yet
        textField.usesSingleLineMode = !textFormat.multiline//<---cant get these to work yet, works now in multiline textfields
        //textField.lineBreakMode = .ByWordWrapping
        //Swift.print("textFormat.wordWrap: " + "\(textFormat.wordWrap)")
        textField.cell?.wraps = textFormat.wordWrap//wordwrap enables the text to be in one line basically
        //if(textFormat.multiline) {textField.setContentCompressionResistancePriority(50, forOrientation: .Horizontal)}//this is for auto-layout only i think
        textField.cell?.scrollable = textFormat.scrollable//i guess this is connected to wordWrap
        
        textField.attributedStringValue = attrString
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
     * TODO: The paragraph style stuff doesnt seem to work. more research needed
     */
    class func font(fontName:String,_ size:CGFloat) -> NSFont{
        //let paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()//NSMutableParagraphStyle.defaultParagraphStyle()
        //paragraphStyle.lineSpacing = 10.0//other paragraph options: paragraphSpacing,alignment,firstLineHeadIndent,lineBreakMode,minimumLineHeight,maximumLineHeight,baseWritingDirection,lineHeightMultiple,paragraphSpacingBefore
        let fontDescriptor:NSFontDescriptor = NSFontDescriptor(fontAttributes: [NSFontNameAttribute:fontName/*,NSParagraphStyleAttributeName:paragraphStyle*/])//NSForegroundColorAttributeName:NSColor.redColor(),
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
