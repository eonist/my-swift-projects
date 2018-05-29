import Cocoa

extension NSMenuItem {
    /**
     * Makes checking an NSMenuItem check state much more convenient
     */
    var isChecked:Bool {get{return self.state == .on} set{self.state = newValue ?  .on : .off}}
}
