import Cocoa

extension NSWindow {
    /**
     * Shows PARAM: win
     */
    func show(){
        self.makeKeyAndOrderFront(self)//<- should be self, but nil may work
        NSApp.activate(ignoringOtherApps: true)//swift 3 update
    }
    /**
     * Hides PARAM: win
     */
    func hide(_ win:NSWindow){
        self.orderOut(self)//<- should be self, but nil may work
    }
    var minimized:Bool{return self.isAccessibilityMinimized()}/*Convenience*/
    var hidden:Bool{return self.isAccessibilityHidden()}/*Convenience*/
    var expanded:Bool{return self.isAccessibilityExpanded()}/*Convenience*/
    var modal:Bool{return self.isAccessibilityModal()}/*Convenience*/
    var flippedScreenPosition:CGPoint {return CGPoint(NSEvent.mouseLocation.x,abs(NSEvent.mouseLocation.y + -NSScreen.main!.visibleFrame.height))/*flip the y coordianate:*/}/*Returns the topLeft postion of the win in relation to the screen*/
    var topLeft:CGPoint{return CGPoint(frame.origin.x,NSScreen.main!.visibleFrame.height - self.frame.origin.y - self.frame.size.height)}/*returns the topLeft pos (in a flipped coordinate space aka 0,0 coordinate space)*/
    func unFlipScreenPosition(_ pos:CGPoint)->CGPoint{
        return CGPoint(pos.x, abs(pos.y + -NSScreen.main!.visibleFrame.height) - self.frame.size.height)/*flip the y coordinate back*/
    }
    /*New*/
    var size:CGSize {/*Convenience*/
        get{return WinParser.size(self)}
        set{self.setContentSize(CGSize(newValue.width,newValue.height))}
    }
}
extension NSSavePanel{
    /**
     * Creates An NSSavePanel instance
     * NOTE: the initialize word is used instead of init, as init requires much more code to get working
     */
    static func initialize(_ allowedFileTypes:[String] = ["xml"], _ title:String = "Save As", _ canCreateDirectories:Bool = true)->NSSavePanel{
        let panel = NSSavePanel()
        panel.canCreateDirectories = canCreateDirectories
        panel.allowedFileTypes = allowedFileTypes//["css","html","pdf","png"]
        panel.title = title
        return panel
    }
}
extension NSOpenPanel{
    /**
     * Creates An NSSavePanel instance
     * NOTE: the initialize word is used instead of init, as init requires much more code to get working
     */
    static func initOpenPanel( allowedFileTypes:[String] = ["xml"],  title:String = "Open",  canCreateDirectories:Bool = true)->NSOpenPanel{
        let panel = NSOpenPanel()
        panel.canCreateDirectories = canCreateDirectories
        panel.allowedFileTypes = allowedFileTypes//["css","html","pdf","png"]
        panel.title = title
        return panel
    }
}
