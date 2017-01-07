import Cocoa
/**
 * NOTE: There are also methods related to the window in the AppExtension.swift clas
 */
class WinParser {
    /**
     * NOTE: grab the from applicationDidFinishLaunching
     * NOTE: to manage the windows: app.windowWithWindowNumber(w.windowNumber)
     * EXAMPLE: let app:NSApplication = aNotification.object as! NSApplication//then use the app in this method
     */
    static func describeWindows(app:NSApplication){
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
    static func height(window:NSWindow)->CGFloat{
        return NSWindow.contentRectForFrameRect(window.frame, styleMask: window.styleMask).height
    }
    /**
     * Returns the first window in NSApp of a spedific class or protocol type
     * NOTE: there is also window.isMemberOfClass which could work, but it wont work for protocols
     * CAUTION: The type provided must be absolute. Meaning storing a type and then using it here wont work, only direct access to the class type will work like: String.self
     * PARAM:strict is a Boolean flag that allows an absolute assert of the class, say if you store the class type in a variable ebfore calling this method and the generic is a subType then the strict flag works well to assert absolutness. (It does not work with protocols, research into protocol supoprt for the strict flag is out of scope for now)
     * NOTE: you only need to use the strict flag if you work with stored class types.
     */
    static func firstWindow<T>(type:T.Type, _ strict:Bool = false)-> T? {
        for window : NSWindow in NSApp.windows {if((window as? T != nil && !strict) || (type is AnyClass && window.isMemberOfClass(type as! AnyClass))) {return window as? T}}
        return nil
    }
    /**
     * Returns an array of NSWindow of type T in the current app
     */
    static func windowsOfType<T>(type:T.Type)-> [T] {
        var windows:Array<T> = []
        for window : NSWindow in NSApp.windows { if(window as? T != nil) {windows.append(window as! T)}}
        return windows
    }
    /**
     * Returns the front most window in NSApp of a spedific class or protocol type
     */
    static func frontMostWinOfType<T:NSWindow>(type:T.Type)-> T?{
        var windows:Array<T> = []
        for window : NSWindow in NSApp.windows { if(window as? T != nil) {windows.append(window as! T)}}
        windows.sortInPlace { (a, b) -> Bool in return a.orderedIndex > b.orderedIndex}
        return windows.count > 0 ? windows[0] : nil
    }
    /**
     * Returns the first focusedWindow in the NSApplication.windows array
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    static func focusedWindow()->NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilityFocused()})!
    }
}
private class Utils{
    /**
     * NOTE: Reducing for-loops is a great way to maintain readability and maintain code modularity. Here is a trick were we use closure blocks to encapsulate the method call. The for loop is the same but the method call is different. This approach is great when you need the code within the for-loop to be the same but you want to have the code within different methods to be different
     */
    static func performAction(windows:Array<NSWindow>, _ action:(NSWindow)->Bool)->NSWindow?{
        for window in windows{
            //print("windowNumber: " + "\(win.windowNumber)")
            if(action(window)){
                return window
            }
        }
        return nil
    }
}