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
extension NSSavePanel{
    /**
     * Creates 
     */
    func create(allowedFileTypes:Array<String> = ["xml"], _ title:String = "Save As", _ canCreateDirectories:Bool = true)->NSSavePanel{
        let savePanel = NSSavePanel()
        savePanel.canCreateDirectories = true
        savePanel.allowedFileTypes = allowedFileTypes//["css","html","pdf","png"]
        savePanel.title = "Save As"
        return savePanel
    }
}