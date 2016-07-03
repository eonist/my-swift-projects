import Cocoa

extension NSApplication{
    /**
     *
     */
    var focusedWindow:NSWindow {
        //(app.windows[0] as! )
        for win in self.windows{
            print("windowNumber: " + "\(win.windowNumber)")
            win.isAccessibilityFocused()
            //app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
            
        }
        return nil
    }
}
