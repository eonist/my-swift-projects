import Cocoa

extension NSMenuItem {
    var checked:Bool {get{return self.state == NSOnState} set{self.state = newValue ?  NSOnState : NSOffState}}
}
