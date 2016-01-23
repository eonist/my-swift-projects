import Cocoa

class WindowParser {
    /**
     *
     */
    class func describeWindows(app:NSApplication){
        Swift.print("app.windows.count: " + "\(app.windows.count)")
        for w in app.windows{
            print("windowNumber: " + "\(w.windowNumber)")
            app.windowWithWindowNumber(w.windowNumber)//this is how you can manage windows
        }
    }
}
