import Cocoa

extension NSMenuItem {
    /**
     * Makes checking an NSMenuItem check state much more convenient
     */
    var checked:Bool {get{return self.state == NSControl.StateValue.onState} set{self.state = newValue ?  NSControl.StateValue.onState : NSControl.StateValue.offState}}
}
