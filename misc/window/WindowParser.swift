import Cocoa

class WindowParser {
    /**
     * NOTE: grab the from applicationDidFinishLaunching
     * EXAMPLE: let app:NSApplication = aNotification.object as! NSApplication//then use the app in this method
     * NOTE: to manage the windows: app.windowWithWindowNumber(w.windowNumber)
     */
    class func describeWindows(app:NSApplication){
        Swift.print("app.windows.count: " + "\(app.windows.count)")
        for w in app.windows{
            print("windowNumber: " + "\(w.windowNumber)")
            app.windowWithWindowNumber(w.windowNumber)//this is how you can manage windows
        }
    }
    /**
     * NOTE: returns the window height (including the titleBar height)
     * NOTE: to return window height not including the titleBar height, the use window!.frame.height
     * NOTE: this method can also be used if you diff this method and the frame.height
     */
    class func height(window:NSWindow)->CGFloat{
        return NSWindow.contentRectForFrameRect(window.frame, styleMask: window.styleMask).height
    }
}
