import Cocoa

extension NSMenuItem {
    /**
     * Makes checking an NSMenuItem check state much more convenient
     */
    var checked:Bool {get{return self.state == NSControl.StateValue.on} set{self.state = newValue ?  NSControl.StateValue.on : NSControl.StateValue.off}}
}
