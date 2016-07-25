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
    var minimized:Bool{return self.isAccessibilityMinimized()}//Convenience
    var hidden:Bool{return self.isAccessibilityHidden()}//Convenience
    var expanded:Bool{return self.isAccessibilityExpanded()}//Convenience
    var modal:Bool{return self.isAccessibilityModal()}//Convenience
}
extension NSSavePanel{
    /**
     * Creates An NSSavePanel instance
     * NOTE: the initialize word is used instead of init, as init requires much more code to get working
     */
    class func initialize(allowedFileTypes:Array<String> = ["xml"], _ title:String = "Save As", _ canCreateDirectories:Bool = true)->NSSavePanel{
        let savePanel = NSSavePanel()
        savePanel.canCreateDirectories = canCreateDirectories
        savePanel.allowedFileTypes = allowedFileTypes//["css","html","pdf","png"]
        savePanel.title = title
        return savePanel
    }
}