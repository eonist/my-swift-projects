import Cocoa

extension NSWindow {
    /**
     * Shows @param: win
     */
    func show(){
        self.makeKeyAndOrderFront(self)//<- should be self, but nil may work
        NSApp.activateIgnoringOtherApps(true)
    }
    /**
     * Hides @param: win
     */
    func hide(win:NSWindow){
        self.orderOut(self)//<- should be self, but nil may work
    }
}
