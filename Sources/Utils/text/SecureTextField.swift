import Cocoa

class SecureTextField:NSSecureTextField {
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        return super.hitTest(CGPoint(localPos().x,localPos().y))
    }
    override func textDidChange(_ notification:Notification) {
        if(self.superview is EventSendable){
            //Swift.print("superview is IEventSender")
            (self.superview as! EventSendable).event(TextFieldEvent(Event.update,self))
        }else{
            //Swift.print("superview is NOT IEventSender")
        }
        super.textDidChange(notification)
    }
}
