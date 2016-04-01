import Cocoa

class TextField:NSTextField{
    var globalMouseDownHandler:AnyObject?
    /**
     * NOTE: You must use InteractiveView as a parent for this class to work
     * NOTE: the hitTesting bellow is the only combination I found that will give a correct hit. the x can also be derived from the
     */
    override func hitTest(aPoint: NSPoint) -> NSView? {
        //Swift.print("CustomText: hitTest()" + "\(aPoint)" + " localPos(): " + "\(localPos())")
        //let tempPos = self.convertPoint(aPoint,fromView:nil)
        //Swift.print("tempPos: " + "\(tempPos)")
        return super.hitTest(CGPoint(localPos().x,localPos().y))
    }
    override func mouseDown(theEvent: NSEvent) {
        Swift.print("TextField.mouseDown() theEvent: " + "\(theEvent)")
        globalMouseDownHandler = NSEvent.addLocalMonitorForEventsMatchingMask([.LeftMouseDownMask], handler:onMouseDownOutside)//we add an eventListener that takes care of resigning the edit mode of the textField
        super.mouseDown(theEvent)
    }
    func onMouseDownOutside(event:NSEvent)-> NSEvent?{
        //Swift.print("onThumbMove " + "localPos: " + "\(event.localPos(self))")
        if(hitTest(event.localPos(self)) == nil){//if you click outside the NSTextField then this will take care of resiging the caret of the text
            //Swift.print("resign")
            if(globalMouseDownHandler != nil) {NSEvent.removeMonitor(globalMouseDownHandler!)}//we remove the evenListener as its done its job
            self.window?.makeFirstResponder(nil)//resigns the NSTextField caret focus
        }
        return event
    }
    override func textDidChange(notification: NSNotification) {
        Swift.print("TextField.textDidChange()")
        if(self.superview is IEventSender){
            Swift.print("superview is IEventSender")
            (self.superview as! IEventSender).event!(TextFieldEvent(Event.update,self/*,self*/))
        }else{
            Swift.print("superview is NOT IEventSender")
        }
        super.textDidChange(notification)
    }
}