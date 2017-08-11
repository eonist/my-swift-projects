import Cocoa
/**
 * Simplifies interaction with the NSTextField
 * TODO: ⚠️️ Text carat is not showing. Try creating a bare NSTextField and figure it out, its probalt due to textattribution
 * characterIndexForPoint could be handy
 *
 */
class TextField:NSTextField,Trackable{
//    var mouseDownHandler:Any?
    var trackingArea:NSTrackingArea?
    var monitor:Any?
    /**
     * NOTE: You must use InteractiveView as a parent for this class to work
     * NOTE: the hitTesting bellow is the only combination I found that will give a correct hit. the x can also be derived from the
     */
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
//        Swift.print("TextField: hitTest()" + "\(aPoint)" + " localPos(): " + "\(localPos())")
        //let tempPos = self.convertPoint(aPoint,fromView:nil)
        //Swift.print("tempPos: " + "\(tempPos)")
        let retVal = super.hitTest(CGPoint(localPos().x,localPos().y))
//        Swift.print("retVal: " + "\(retVal)")
        return retVal
    }
    /**/
    override func mouseDown(with theEvent:NSEvent) {
//        Swift.print("TextField.mouseDown")
        self.window!.makeFirstResponder(self)//resigns the NSTextField caret focus
        
        NSEvent.addMonitor(&monitor,.leftMouseDown,onMouseDownOutside)/*we add a global mouse move event listener*/
        super.mouseDown(with: theEvent)
    }
    /**/
    func onMouseDownOutside(_ event:NSEvent) -> Void/*NSEvent?*/{
//        Swift.print("TextField.onMouseDownOutside event.type: \(event.type)")
        let p = window?.mouseLocationOutsideOfEventStream//self.locationInWindow
        if(hitTest(p!) == nil){//if you click outside the NSTextField then this will take care of resiging the caret of the text
//            Swift.print("you click outside")
            NSEvent.removeMonitor(&self.monitor)//we remove the evenListener as its done its job
            
            self.window!.makeFirstResponder(nil)//resigns the NSTextField caret focus
//            resignFirstResponder()
//            self.window?.selectNextKeyView(self.superview)
//            Swift.print("self.window!.firstResponder: " + "\(self.window!.firstResponder)")
            if self.isEditable {
                window?.endEditing(for: nil)
            }
            
        }
//        return event
    }
    override func mouseEntered(with event: NSEvent) {
//                Swift.print("mouseEntered")
        if self.isSelectable {
            let textCursor = NSCursor.iBeam()
            textCursor.setOnMouseExited(false)
            textCursor.setOnMouseEntered(true)
            addCursorRect(frame, cursor:textCursor)
        }
        
        
        let arrowCursor = NSCursor.arrow()
        arrowCursor.setOnMouseExited(true)
        arrowCursor.setOnMouseEntered(false)
        addCursorRect(frame, cursor:arrowCursor)
    }
    //    override func resetCursorRects() {
    //        addCursorRect(frame, cursor:NSCursor.arrow())
    //    }
    override func mouseExited(with event: NSEvent) {
//                Swift.print("TextField.mouseExited")
//        if self.isSelectable {
        
//            discardCursorRects()
//            resetCursorRects()
        
//            Swift.print("set arrow cursor")
//        }
        
    }
    /**
     * NOTE: you should use bounds for the rect but we dont rotate the frame so we don't need to use bounds.
     * NOTE: the only way to update trackingArea is to remove it and add a new one
     * NOTE: we could keep the trackingArea in graphic so its always easy to access, but i dont think it needs to be easily accesible atm.
     * PARAM: owner is the instance that receives the interaction event
     * TODO: ⚠️️ you don't have to store the trackingarea in this class you can get and set the trackingarea from NSView
     */
    override func updateTrackingAreas() {
        self.createTrackingArea([.activeAlways,.mouseEnteredAndExited])
        super.updateTrackingAreas()
    }
    
//   
//    override func becomeFirstResponder() -> Bool {
//        Swift.print("TextField.becomeFirstResponder: ")
//        return super.becomeFirstResponder()
//    }
//    override func resignFirstResponder() -> Bool {
//        Swift.print("TextField.resignFirstResponder: ")
//        return super.resignFirstResponder()
//    }
    override func textStorageWillProcessEditing(_ notification: Notification) {
//        Swift.print("textStorageWillProcessEditing")
    }
    override func textStorageDidProcessEditing(_ notification: Notification) {
//        Swift.print("textStorageDidProcessEditing")
    }
    override func textDidEndEditing(_ notification: Notification) {
//        Swift.print("textDidEndEditing")
        
    }
    override func controlTextDidEndEditing(_ obj: Notification) {
//        Swift.print("controlTextDidEndEditing")
    }
    override func textDidBeginEditing(_ notification: Notification) {
//        Swift.print("textDidBeginEditing \(self.stringValue)")
    }
    override func textShouldEndEditing(_ textObject: NSText) -> Bool {
//        Swift.print("textShouldEndEditing")
        return super.textShouldEndEditing(textObject)
    }
    override func textShouldBeginEditing(_ textObject: NSText) -> Bool {
//        Swift.print("textShouldBeginEditing \(self.stringValue)")
        return super.textShouldBeginEditing(textObject)
    }
    override func textDidChange(_ notification:Notification) {
        _ = self.stringValue//for some strange reason you have to call this variable or the text will be reverted to init state
//        Swift.print("textDidChange \(self.stringValue)")
        if(self.superview is EventSendable){
//            Swift.print("superview is EventSendable")
            (self.superview as! EventSendable).event!(TextFieldEvent(Event.update,self))
        }else{
//            Swift.print("superview is NOT EventSendable")
        }
        super.textDidChange(notification)
    }
}
