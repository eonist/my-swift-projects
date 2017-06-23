import Cocoa

extension NSApplication{
    /**
     * Returns the first focusedWindow in the NSApplication.windows array
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    static var focusedWin:NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilityFocused()})
    }
    /**
     * Returns the front most window in the NSApplication.windows array
     */
    static var frontMostWin:NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilityFrontmost()})!
    }
    /**
     * Returns the first window that is main in the NSApplication.windows array
     * NOTE: you can probably also use the NSApplication.mainWindow call instead of this method
     */
    static var mainWin:NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilityMain()})!
    }
    /**
     * Returns the first window that is selected in the NSApplication.windows array
     * NOTE: you can probably also use the NSApplication.mainWindow call instead of this method
     */
    static var selectedWin:NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilitySelected()})!
    }
}
private class Utils{
    /**
     * NOTE: Reducing for-loops is a great way to maintain readability and maintain code modularity. Here is a trick were we use closure blocks to encapsulate the method call. The for loop is the same but the method call is different. This approach is great when you need the code within the for-loop to be the same but you want to have the code within different methods to be different
     * TODO: Use .first and create a typealias for the action method
     */
    static func performAction(_ windows:[NSWindow], _ action:(NSWindow)->Bool)->NSWindow?{
        for window in windows{
            if action(window) {
                return window
            }
        }
        return nil
    }
}
