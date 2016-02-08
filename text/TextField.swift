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
        Swift.print("theEvent: " + "\(theEvent)")
        
        globalMouseDownHandler = NSEvent.addLocalMonitorForEventsMatchingMask([.LeftMouseDownMask], handler:onMouseDownOutside )
        super.mouseDown(theEvent)
    }
    func onMouseDownOutside(event:NSEvent)-> NSEvent?{
        Swift.print("onThumbMove " + "localPos: " + "\(event.localPos(self))")
        if(hitTest(event.localPos(self)) != nil){
            Swift.print("hit within")
        }else{
            Swift.print("resign")
            self.window?.makeFirstResponder(nil)
        }
        return event
    }
    
    /**
     *
     */
    func onMouseDownOutside(){
        
    }
}
