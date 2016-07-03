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
            win.isAccessibilityFrontmost()
            win.isAccessibilityHidden()
            win.isAccessibilityMain()
            win.isAccessibilityMinimized()
            win.isAccessibilityModal()
            win.isAccessibilitySelected()
            win.isAccessibilityExpanded()
        }
        return nil
    }
    
}
