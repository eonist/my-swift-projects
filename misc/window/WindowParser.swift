import Cocoa

class WindowParser {
    /**
     *
     */
    class func describeWindows(app:NSApplicationDelegate){
        for w in app.windows{
            print("windowNumber: " + "\(w.windowNumber)")
            app.windowWithWindowNumber(w.windowNumber)//this is how you can manage windows
        }
    }
}
