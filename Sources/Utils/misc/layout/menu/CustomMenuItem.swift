import Cocoa

class CustomMenuItem:NSMenuItem{
    init(_ title:String = "", _ keyEquivalent:String = "") {
        super.init(title: title, action:#selector(self.onSelect), keyEquivalent: keyEquivalent)
        target = self/*target specifies where the selector should work, in this case in this class scope*/
        self.isEnabled = true
    }
    @objc func onSelect(event:AnyObject) {
        Swift.print("override in superClass")
    }
    /**
     * Return true if you want to enable the menu item, false will disable it
     * NOTE: add assertion logic here
     */
    override func validateMenuItem(_ menuItem:NSMenuItem) -> Bool {
        //override in subclass (optional)
        return true
    }
    required init(coder decoder:NSCoder) {fatalError("init(coder:) has not been implemented")}
}
