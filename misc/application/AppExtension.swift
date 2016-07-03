import Cocoa

extension NSApplication{
    /**
     *
     */
    var focusedWindow:NSWindow? {
        //(app.windows[0] as! )
        for win in self.windows{
            //print("windowNumber: " + "\(win.windowNumber)")
            //app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
            if(win.isAccessibilityFocused()){return win}
        }
        return nil
    }
}
