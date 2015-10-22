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
