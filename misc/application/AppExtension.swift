import Cocoa

extension NSApplication{
    /**
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    var focusedWindow:NSWindow? {
        return Utils.performAction(self.windows, {$0.isAccessibilityFocused()})!
        
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

/*
//(app.windows[0] as! )
for win in self.windows{
//print("windowNumber: " + "\(win.windowNumber)")
//app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
if(win.isAccessibilityFocused()){return win}
win.isAccessibilityFrontmost()
win.isAccessibilityMain()
win.isAccessibilitySelected()


}
return nil
*/