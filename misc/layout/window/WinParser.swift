import Cocoa

class WinParser {
    /**
     * NOTE: grab the from applicationDidFinishLaunching
     * EXAMPLE: let app:NSApplication = aNotification.object as! NSApplication//then use the app in this method
     * NOTE: to manage the windows: app.windowWithWindowNumber(w.windowNumber)
     */
    class func describeWindows(app:NSApplication){
        
        Swift.print("app.windows.count: " + "\(app.windows.count)")
        for win in app.windows{
            print("windowNumber: " + "\(win.windowNumber)")
            app.windowWithWindowNumber(win.windowNumber)//this is how you can manage windows
        }
    }
    /**
     * NOTE: returns the window height (including the titleBar height)
     * NOTE: to return window height not including the titleBar height, the use window!.frame.height
     * NOTE: this method can also be used if you diff this method and the frame.height to get the titlebar height
     * NOTE: to get the width of a window yu can use: window!.frame.width
     */
    class func height(window:NSWindow)->CGFloat{
        return NSWindow.contentRectForFrameRect(window.frame, styleMask: window.styleMask).height
    }
    /**
     * Returns the first window in NSApp of a spedific class ir protocol type
     */
    class func firstWindow<T>(type:T.Type)-> T? {
        for window : NSWindow in NSApp.windows { if(window as? T != nil) {return window as? T}}
        return nil
    }
}