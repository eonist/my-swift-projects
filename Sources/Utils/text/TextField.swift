import Cocoa
/**
 * Simplifies interaction with the NSTextField
 * TODO: ⚠️️ There are some mouseOut/focusOut problems with this UI component, its probably due to
 */
class TextField:NSTextField{
    var mouseDownHandler:Any?
    /**
     * NOTE: You must use InteractiveView as a parent for this class to work
     * NOTE: the hitTesting bellow is the only combination I found that will give a correct hit. the x can also be derived from the
     */
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        //Swift.print("CustomText: hitTest()" + "\(aPoint)" + " localPos(): " + "\(localPos())")
        //let tempPos = self.convertPoint(aPoint,fromView:nil)
        //Swift.print("tempPos: " + "\(tempPos)")
        
        return super.hitTest(CGPoint(localPos().x,localPos().y))//
    }
    override func mouseDown(with theEvent:NSEvent) {
        Swift.print("mouseDown")
        if(mouseDownHandler == nil){
            mouseDownHandler = NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDown], handler:onMouseDownOutside)
        }//we add an eventListener that takes care of resigning the edit mode of the textField
        super.mouseDown(with: theEvent)
    }
    func onMouseDownOutside(_ event:NSEvent) -> NSEvent?{
        Swift.print("onMouseDownOutside")
        if(hitTest(event.localPos(self)) == nil){//if you click outside the NSTextField then this will take care of resiging the caret of the text
            if(mouseDownHandler != nil) {NSEvent.removeMonitor(mouseDownHandler!)}//we remove the evenListener as its done its job
            self.window?.makeFirstResponder(nil)//resigns the NSTextField caret focus
        }
        return event
    }
    override func textStorageWillProcessEditing(_ notification: Notification) {
        Swift.print("textStorageWillProcessEditing")
    }
    override func textStorageDidProcessEditing(_ notification: Notification) {
        Swift.print("textStorageDidProcessEditing")
    }
    override func textDidEndEditing(_ notification: Notification) {
        Swift.print("textDidEndEditing")
    }
    override func textDidBeginEditing(_ notification: Notification) {
        Swift.print("textDidBeginEditing")
    }
    override func textShouldEndEditing(_ textObject: NSText) -> Bool {
        Swift.print("textShouldEndEditing")
        return super.textShouldEndEditing(textObject)
    }
    override func textShouldBeginEditing(_ textObject: NSText) -> Bool {
        Swift.print("textShouldBeginEditing")
        return super.textShouldBeginEditing(textObject)
    }
    override func textDidChange(_ notification:Notification) {
        Swift.print("textDidChange")
        if(self.superview is IEventSender){
            //Swift.print("superview is IEventSender")
            (self.superview as! IEventSender).event!(TextFieldEvent(Event.update,self))
        }else{
            //Swift.print("superview is NOT IEventSender")
        }
        super.textDidChange(notification)
    }
}
