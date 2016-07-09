import Cocoa

extension NSApplication{
    static func testing()->String{
        return ""
    }
    /**
     * Returns the first focusedWindow in the NSApplication.windows array
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    var focusedWindow:NSWindow? {
        return Utils.performAction(self.windows, {$0.isAccessibilityFocused()})!
    }
    /**
     * Returns the front most window in the NSApplication.windows array
     */
    var frontMost:NSWindow? {
        return Utils.performAction(self.windows, {$0.isAccessibilityFrontmost()})!
    }
    /**
     * Returns the first window that is main in the NSApplication.windows array
     * NOTE: you can probably also use the NSApplication.mainWindow call instead of this method
     */
    var mainWin:NSWindow? {
        return Utils.performAction(self.windows, {$0.isAccessibilityMain()})!
    }
    /**
     * Returns the first window that is selected in the NSApplication.windows array
     * NOTE: you can probably also use the NSApplication.mainWindow call instead of this method
     */
    var selected:NSWindow? {
        return Utils.performAction(self.windows, {$0.isAccessibilitySelected()})!
    }
}

private class Utils{
    /**
     * NOTE: Reducing for-loops is a great way to maintain readability and maintain code modularity. Here is a trick were we use closure blocks to encapsulate the method call. The for loop is the same but the method call is different. This approach is great when you need the code within the for-loop to be the same but you want to have the code within different methods to be different
     */
    static func performAction(windows:Array<NSWindow>, _ action:(NSWindow)->Bool)->NSWindow?{
        for window in windows{
            //print("windowNumber: " + "\(win.windowNumber)")
            if(action(window)){
                return window
            }
        }
        return nil
    }
}