import Cocoa

extension NSApplication{
    
    var activeWindow:NSWindow {
        
        //(app.windows[0] as! )
        for win in self.windows{
            print("windowNumber: " + "\(win.windowNumber)")
            app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
            
        }
        return nil
    }
}
