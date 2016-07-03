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
            
            var completionHandler:(Float)->Void = {
                (arg:Float) -> Void in
            }
            //Continue here: Find the code for adding a method to a variable and executing it , so that you only have to write the for loop once
            
        }
        return nil
    }
}

private class Utils{
    /**
     *
     */
    static func performAction(app:NSApplication,_ action:(win:NSWindow)->Void)->NSWindow?{
        for win in app.windows{
            if(win.isAccessibilityFocused()){return win}
        }
        return nil
    }
}