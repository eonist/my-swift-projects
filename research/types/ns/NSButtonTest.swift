//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Button.html#//apple_ref/doc/uid/10000019i
//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Button.html
//changing the osx close minimize and max buttons: http://fredandrandall.com/blog/2011/09/22/how-to-make-your-app-window-look-like-the-mac-app-store-twitter-and-chrome/
/**

you set pos:
(buttons[0] as NSButton).setFrameOrigin(newPos)

you set size: 
(buttons[0] as NSButton).setFrameSize(newSize)


removing a button:
removeFromSuperView

to get button size:

//Swift.print("button.frame.width: " + "\(button.frame.width)")
        //Swift.print("button.frame.height: " + "\(button.frame.height)")
*/


//Add button to titlebar: http://fredandrandall.com/blog/2011/09/14/adding-a-button-or-view-to-the-nswindow-title-bar/


import Cocoa

class NSButtonTest {
    let button = NSButton()
    
    func test(){
        button.target = self
        button.action = "myAction:"
    }
    
    //The above specifies callback on 'self' to be the function
    
    func myAction(obj:AnyObject?){
        print("press")
        if let btn = obj as? NSButton{
            print(btn.title)
        }
        
    }
}


/*

Supports fill not stroke
(button.cell as! NSButtonCell).bordered = false//The background color is used only when drawing borderless buttons.
(button.cell as! NSButtonCell).backgroundColor = NSColor.redColor()


*/


/*
setting button style:
let button = NSButton(frame: NSRect(x: 0, y: 0, width: width, height: height))
        
        //button.highlight(true)
        let buttonCell:NSButtonCell = button.cell! as! NSButtonCell
        buttonCell.bezelStyle = bezelStyle//NSBezelStyle.SmallSquareBezelStyle//NSBezelStyle.RoundedBezelStyle
        



*/
¨
/*
Add cursor to buttons:

- (void)resetCursorRects
{
    if (self.cursor) {
        [self addCursorRect:[self bounds] cursor: self.cursor];
    } else {
        [super resetCursorRects];
    }
}

*/


/*
chaining text color of NSButton
https://www.youtube.com/watch?v=zgBG6IemE8M

button.title = "Test"

button.font = NSFont(name: "Century Gothic Bold", size: 26)
*/

