import Cocoa
/**
 * Simplifies interaction with the NSTextField
 * TODO: ⚠️️ Text carat is not showing. Try creating a bare NSTextField and figure it out, its probalt due to textattribution
 * characterIndexForPoint could be handy
 *
 */
class TextField2:NSTextField,Trackable{
    //    var mouseDownHandler:Any?
    var trackingArea:NSTrackingArea?
    var monitor:Any?
    
    //    override var canBecomeKeyView: Bool {return true}
    
    
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
        Swift.print("TextField.mouseDown")
        //        self.window!.makeFirstResponder(self)//resigns the NSTextField caret focus
        
        NSEvent.addMonitor(&monitor,NSEvent.EventTypeMask.leftMouseDown,onMouseDownOutside)/*we add a global mouse move event listener*/
        //        becomeFirstResponder()
        //         self.selectText(self)
        //        self.currentEditor()?.moveToEndOfLine(nil)
        
        //        self.selectText(self)
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
        //        Swift.print("mouseEntered self.isSelectable: \(self.isSelectable)")
        if self.isSelectable {
            addCursorRect(frame, cursor:NSCursor.iBeam)//sets the default text cursor
        }
        super.mouseEntered(with: event)
    }
    override func mouseExited(with event: NSEvent) {
        //        Swift.print("mouseExited self.isSelectable:\(self.isSelectable  )")
        resetCursorRects()//reset to default mouse Cursor
        cursorUpdate(with: event)//<-- ⚠️️ this is important to call or you might get stuck ibeam cursors
    }
    /**
     * NOTE: you should use bounds for the rect but we dont rotate the frame so we don't need to use bounds.
     * NOTE: the only way to update trackingArea is to remove it and add a new one
     * NOTE: we could keep the trackingArea in graphic so its always easy to access, but i dont think it needs to be easily accesible atm.
     * PARAM: owner is the instance that receives the interaction event
     * TODO: ⚠️️ you don't have to store the trackingarea in this class you can get and set the trackingarea from NSView
     */
    override func updateTrackingAreas() {
        self.createTrackingArea([NSTrackingArea.Options.activeAlways,NSTrackingArea.Options.mouseEnteredAndExited])
        super.updateTrackingAreas()
    }
    
    
    //    override func becomeFirstResponder() -> Bool {
    //        let responder = super.becomeFirstResponder()
    //        Swift.print("TextField.becomeFirstResponder: \(self) \(responder)")
    //        return responder
    //    }
    //    override func resignFirstResponder() -> Bool {
    //        let responder = super.resignFirstResponder()
    //        Swift.print("TextField.resignFirstResponder: \(self) \(responder)")
    //        return responder
    //    }
    //    override func textStorageWillProcessEditing(_ notification: Notification) {
    ////        Swift.print("textStorageWillProcessEditing")
    //        super.textStorageWillProcessEditing(notification)
    //    }
    //    override func textStorageDidProcessEditing(_ notification: Notification) {
    ////        Swift.print("textStorageDidProcessEditing")
    //        super.textStorageDidProcessEditing(notification)
    //    }
    //    override func textDidEndEditing(_ notification: Notification) {
    ////        Swift.print("textDidEndEditing")
    //        super.textDidEndEditing(notification)
    //    }
    //    override func controlTextDidEndEditing(_ obj: Notification) {
    //        super.controlTextDidEndEditing(obj)
    ////        Swift.print("controlTextDidEndEditing")
    //    }
    //    override func textDidBeginEditing(_ notification: Notification) {
    //        Swift.print("textDidBeginEditing \(self.stringValue)")
    ////        customizeCaretColor(caretColor: .green)
    //        super.textDidBeginEditing(notification)
    //    }
    //    override func textShouldEndEditing(_ textObject: NSText) -> Bool {
    ////        Swift.print("textShouldEndEditing")
    //        return super.textShouldEndEditing(textObject)
    //    }
    //    override func textShouldBeginEditing(_ textObject: NSText) -> Bool {
    ////        Swift.print("textShouldBeginEditing \(self.stringValue)")
    //        return super.textShouldBeginEditing(textObject)
    //    }
    override func textDidChange(_ notification:Notification) {
        _ = self.stringValue//for some strange reason you have to call this variable or the text will be reverted to init state
        //        Swift.print("textDidChange \(self.stringValue)")
        if(self.superview is EventSendable){
            //            Swift.print("superview is EventSendable")
            (self.superview as! EventSendable).event(TextFieldEvent(Event.update,self))
        }else{
            //            Swift.print("superview is NOT EventSendable")
        }
        super.textDidChange(notification)
    }
    /**
     * Support for copy/paste/undo/select all when you don't have an edit NSMenu
     */
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        if event.type == NSEvent.EventType.keyDown {
            if (event.modifierFlags.rawValue & NSEvent.ModifierFlags.deviceIndependentFlagsMask.rawValue) == NSEvent.ModifierFlags.command.rawValue {
                switch event.charactersIgnoringModifiers! {
                case "x" where NSApp.sendAction(#selector(NSText.cut(_:)), to:nil, from:self):return true
                case "c" where NSApp.sendAction(#selector(NSText.copy(_:)), to:nil, from:self):return true
                case "v" where NSApp.sendAction(#selector(NSText.paste(_:)), to:nil, from:self):return true
                case "z" where NSApp.sendAction(Selector(("undo:")), to:nil, from:self) :return true
                case "a" where NSApp.sendAction(#selector(NSResponder.selectAll(_:)), to:nil, from:self):return true
                default:
                    break
                }
            }
            else if (event.modifierFlags.rawValue & NSEvent.ModifierFlags.deviceIndependentFlagsMask.rawValue) == NSEvent.ModifierFlags.command.rawValue | NSEvent.ModifierFlags.shift.rawValue {
                if event.charactersIgnoringModifiers == "Z" && NSApp.sendAction(Selector(("redo:")), to:nil, from:self) {
                    return true
                }
            }
        }
        return super.performKeyEquivalent(with: event)
    }
    
}
//extension NSTextField {
//    public func customizeCaretColor(caretColor: NSColor) {
//        Swift.print("before")
//        guard let fieldEditor = self.currentEditor() as? NSTextView else {return}//self.window?.fieldEditor(true, for: self) as! NSTextView
//        fieldEditor.insertionPointColor = caretColor
//        fieldEditor.backgroundColor = .orange
//
//        //textField.currentEditor()?
//        fieldEditor.selectedRange = NSRange(location: 4, length: 0)
//        Swift.print("fieldEditor.isEditable: " + "\(fieldEditor.isEditable)")
//        fieldEditor.isEditable = true
//        Swift.print("fieldEditor.isSelectable: " + "\(fieldEditor.isSelectable)")
//        fieldEditor.isSelectable = true
//
//        self.displayIfNeeded()
//    }
//}


