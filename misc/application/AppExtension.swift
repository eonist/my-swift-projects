import Cocoa

extension NSApplication{
    /**
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    var focusedWindow:NSWindow? {
        //(app.windows[0] as! )
        for win in self.windows{
            //print("windowNumber: " + "\(win.windowNumber)")
            //app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
            if(win.isAccessibilityFocused()){return win}
            win.isAccessibilityFrontmost()
            win.isAccessibilityMain()
            win.isAccessibilitySelected()
            
            let temp:(NSWindow)->Bool = {
                (arg:NSWindow) -> Bool in
                arg.isAccessibilityFocused()
            }
            Utils.performAction(self.windows,temp)
        }
        return nil
    }
}

private class Utils{
    /**
     *
     */
    static func performAction(windows:Array<NSWindow>, _ action:(NSWindow)->Bool)->NSWindow?{
        for window in windows{
            if(action(window)){
                return window
            }
        }
        return nil
    }
}