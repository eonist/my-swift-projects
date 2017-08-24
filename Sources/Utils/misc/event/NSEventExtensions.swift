import Cocoa

extension NSEvent {
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: ⚠️️ hopefully this method also works if the view is not 0,0 in the window
     */
    func localPos(_ view:NSView)->CGPoint{
        return view.convert(self.locationInWindow,from:nil)
    }
    var shiftKey:Bool {return self.modifierFlags.contains(NSEvent.ModifierFlags.shift)}/*Convenience*/
    var commandKey:Bool {return self.modifierFlags.contains(NSEvent.ModifierFlags.command)}/*Convenience*/
    var altKey:Bool {return self.modifierFlags.contains(NSEvent.ModifierFlags.option)}/*Convenience*/
    var ctrlKey:Bool {return self.modifierFlags.contains(NSEvent.ModifierFlags.control)}/*Convenience*/
    //Bonus: There is also FunctionKeyMask
    static func cmdKey()->Bool{/*Convenience*/
        return NSEvent.modifierFlags.contains(NSEvent.ModifierFlags.shift)
    }

    var scrollingDelta:CGPoint {return CGPoint(self.scrollingDeltaX,self.scrollingDeltaY)}/*Convenience*/
    var delta:CGPoint {return CGPoint(self.deltaX,self.deltaY)}/*Convenience*/
    /*func scrollingDelta(_ dir:Dir)->CGFloat{/*Convenience*/
     return dir == .hor ? self.scrollingDeltaX : (dir == .ver ? self.scrollingDeltaY : NaN)
     }*/
}

/**
 * Simplifies monitoring NSEvents
 * NOTE: Handling and setting up event monitoring is error prone and a big hassle, this extension simplifies this process. It doesn't fit all cases but for simple interaction monitoring it's pretty use-ful
 * NOTE: The big pay-off is that you dont have to check if monitor has already been added and remove it and set it to nil etc. You just have to deal with 2 methods and everything else is handled for you
 * NOTE: You can also remove and add repeatedly with-out worrying if something was already added etc. Error-proof
 * NSEventMask types: leftMouseDown,leftMouseUp,rightMouseDown,rightMouseUp,mouseMoved,leftMouseDragged,rightMouseDragged,mouseEntered,mouseExited,keyDown,keyUp,flagsChanged,appKitDefined,systemDefined,applicationDefined,periodic,cursorUpdate,scrollWheel,tabletPoint,tabletProximity,otherMouseDown,otherMouseUp,otherMouseDragged
 * NSEventMask gesture types: gesture,magnify,swipe,rotate,beginGesture,endGesture
 * TODO: ⚠️️ You might want to add propegates:Bool flag that blocks further event-propegation etc
 */
extension NSEvent{
    typealias CallBack = (NSEvent)->Void//TODO: ⚠️️ Find a more appropriate name than CallBack
    /**
     * EXAMPLE: var monitor:Any?;NSEvent.addMonitor(monitor,.leftMouseDragged) {event in Swift.print(event.type)}
     */
    static func addMonitor(_  monitor:inout Any?,_ eventMask:NSEvent.EventTypeMask, _ callBack:@escaping CallBack){
        if(monitor == nil) {
            monitor = NSEvent.addLocalMonitorForEvents(matching: [eventMask], handler: {event -> NSEvent in callBack(event);return event})/*The closure returns the event so the event can propegate internally in the NSApp*/
        }else {
            removeMonitor(&monitor)/*remove event handler before adding a new one*/
            addMonitor(&monitor, eventMask, callBack)//try adding the eventHandler again
        }
    }
    /**
     * Asserts if the eventMonitor exists before removing it and setting the reference to nil
     * EXAMPLE: var monitor:Any?;NSEvent.removeMonitor(monitor,.leftMouseDragged)
     */
    static func removeMonitor(_ monitor:inout Any?){
        if(monitor != nil){
            NSEvent.removeMonitor(monitor!)
            monitor = nil/*<--this part may not be needed*/
        }
    }
}

