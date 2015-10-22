//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Button.html#//apple_ref/doc/uid/10000019i
https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Button/Button.html

/**

you set pos:
(buttons[0] as NSButton).setFrameOrigin(newPos)

you set size: 
(buttons[0] as NSButton).setFrameSize(newSize)
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
