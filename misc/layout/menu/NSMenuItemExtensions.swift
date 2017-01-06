import Cocoa

extension NSMenuItem {
    /**
     * Makes checking an NSMenuItem check state much more convenient
     */
    var checked:Bool {get{return self.state == NSOnState} set{self.state = newValue ?  NSOnState : NSOffState}}
}