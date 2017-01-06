import Cocoa

extension NSEvent {
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: hopefully this method also works if the view is not 0,0 in the window
     */
    func localPos(view:NSView)->CGPoint{
        return view.convertPoint(self.locationInWindow,fromView:nil)
    }
    var shiftKey:Bool {return self.modifierFlags.contains(.ShiftKeyMask)}/*Convenience*/
    var commandKey:Bool {return self.modifierFlags.contains(.CommandKeyMask)}/*Convenience*/
    var altKey:Bool {return self.modifierFlags.contains(.AlternateKeyMask)}/*Convenience*/
    var ctrlKey:Bool {return self.modifierFlags.contains(.ControlKeyMask)}/*Convenience*/
    //Bonus: There is also FunctionKeyMask
    static func cmdKey()->Bool{/*Convenience*/
        return NSEvent.modifierFlags().contains(.ShiftKeyMask)
    }
}