import Cocoa

extension NSEvent {
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: hopefully this method also works if the view is not 0,0 in the window
     */
    func localPos(_ view:NSView)->CGPoint{
        return view.convert(self.locationInWindow,from:nil)
    }
    var shiftKey:Bool {return self.modifierFlags.contains(NSEventModifierFlags.shift)}/*Convenience*/
    var commandKey:Bool {return self.modifierFlags.contains(NSEventModifierFlags.command)}/*Convenience*/
    var altKey:Bool {return self.modifierFlags.contains(NSEventModifierFlags.option)}/*Convenience*/
    var ctrlKey:Bool {return self.modifierFlags.contains(NSEventModifierFlags.control)}/*Convenience*/
    //Bonus: There is also FunctionKeyMask
    static func cmdKey()->Bool{/*Convenience*/
        return NSEvent.modifierFlags().contains(NSEventModifierFlags.shift)
    }
    /**
     * Asserts if the eventMonitor exists before removing it and setting the reference to nil
     */
    func removeMonitor(_ eventMonitor:inout Any?) {
        if(eventMonitor != nil){
            NSEvent.removeMonitor(eventMonitor!)
            eventMonitor = nil
        }
    }

    var scrollingDelta:CGPoint {return CGPoint(self.scrollingDeltaX,self.scrollingDeltaY)}/*Convenience*/
    var delta:CGPoint {return CGPoint(self.deltaX,self.deltaY)}/*Convenience*/
    /*func scrollingDelta(_ dir:Dir)->CGFloat{/*Convenience*/
     return dir == .hor ? self.scrollingDeltaX : (dir == .ver ? self.scrollingDeltaY : NaN)
     }*/
}

/**
 * This is on the idea stage for now
 */
class EventMonitor{
    /**
     * Makes adding event monitors less verbose
     */
    func addLocalMonitor(_ mask: NSEventMask,_  block: @escaping (NSEvent) -> NSEvent?) -> Any?{
        return NSEvent.addLocalMonitorForEvents(matching:mask, handler:block)
    }
}
