import Cocoa

extension NSMenuItem {
    /**
     * Makes checking an NSMenuItem check state much more convenient
     */
    var isChecked:Bool {get{return self.state == NSControl.StateValue.on} set{self.state = newValue ?  NSControl.StateValue.on : NSControl.StateValue.off}}
}
