import Cocoa
/**
 * Consider createing a default init that sets these values
 */
struct TextFormat {
    var background:Bool = false
    var backgroundColor:NSColor = NSColor.clear
    var selectable:Bool = false
    var color:NSColor = NSColor.gray
    var align:String = "left"//text.alignment = NSTextAlignment.Center//Left,Right,Justified,Natural,Center
    var font:String = "Lucida Grande"
    var size:CGFloat = 12
    var type:String = "dynamic"/*input and static*/
    var border:Bool = false
    var multiline:Bool = false
    var wordWrap:Bool = true
    var scrollable:Bool = true
    var leading:CGFloat = NaN
    var password:Bool = false
    //TODO: autoSize can be implemented, check stackoverflow
}



/*

Research for implementing lineSpacing: (this task is completed ✅, but was pretty complicated, so keep these notes)

// text height is called line spacing in NsTextfield

//possible solution for the line-height problem: http://stackoverflow.com/questions/1958176/setting-the-line-height-line-spacing-in-an-nstextview

// this has the most complete answer: http://stackoverflow.com/questions/8356904/cocoa-nstextfield-line-spacing

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
