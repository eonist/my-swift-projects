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
    static func describeWindows(_ app:NSApplication){
        Swift.print("app.windows.count: " + "\(app.windows.count)")
        app.windows.forEach{ win in
            print("windowNumber: " + "\(win.windowNumber)")
            app.window(withWindowNumber: win.windowNumber)//this is how you can manage windows
        }
    }
    /**
     * NOTE: Returns the window height (including the titleBar height)
     * NOTE: To return window height not including the titleBar height, the use window!.frame.height
     * NOTE: This method can also be used if you diff this method and the frame.height to get the titlebar height
     * NOTE: To get the width of a window yu can use: window!.frame.width
     */
    static func height(_ window:NSWindow)->CGFloat{
        return NSWindow.contentRect(forFrameRect:window.frame, styleMask: window.styleMask).height
    }
    /**
     * New
     */
    static func width(_ window:NSWindow)->CGFloat{
        return NSWindow.contentRect(forFrameRect:window.frame, styleMask: window.styleMask).width
    }
    /**
     * Example: WinParser.size(NSApp.windows.first!)//CGSize(400,600) etc
     */
    static func size(_ window:NSWindow) -> CGSize{
        return CGSize(width(window),height(window))
    }
    /**
     * New
     */
    static func topLeft(_ window:NSWindow) -> CGPoint{
        return window.frame.topLeft
    }
    /**
     * Returns the first window in NSApp of a spedific class or protocol type
     * NOTE: there is also window.isMemberOfClass which could work, but it wont work for protocols
     * CAUTION: The type provided must be absolute. Meaning storing a type and then using it here wont work, only direct access to the class type will work like: String.self
     * PARAM: strict is a Boolean flag that allows an absolute assert of the class, say if you store the class type in a variable ebfore calling this method and the generic is a subType then the strict flag works well to assert absolutness. (It does not work with protocols, research into protocol supoprt for the strict flag is out of scope for now)
     * NOTE: you only need to use the strict flag if you work with stored class types.
     */
    static func firstWindow<T>(_ type:T.Type, _ strict:Bool = false)-> T? {
        return NSApp.windows.first(where:{
            ($0 as? T != nil && !strict) || (type is AnyClass && $0.isMember(of:type as! AnyClass))
        }) as? T
    }
    /**
     * Returns an array of NSWindow of type T in the current app
     */
    static func windowsOfType<T>(_ type:T.Type)-> [T] {
        return NSApp.windows.lazy.filter(){$0 as? T != nil}.map{$0 as! T}
    }
    /**
     * Returns the front most window in NSApp of a spedific class or protocol type
     */
    static func frontMostWinOfType<T:NSWindow>(_ type:T.Type)-> T?{
        var windows:[T] = NSApp.windows.lazy.filter(){ win in
                win as? T != nil
            }.map{
                $0 as! T
            }
        windows.sort { (a, b) -> Bool in return a.orderedIndex > b.orderedIndex}
        return windows.count > 0 ? windows[0] : nil
    }
    /**
     * Returns the first focusedWindow in the NSApplication.windows array
     * NOTE: there are also: win.isAccessibilityHidden(),isAccessibilityMinimized(),isAccessibilityModal(),isAccessibilityExpanded()
     */
    static func focusedWindow()->NSWindow? {
        return Utils.performAction(NSApp.windows, {$0.isAccessibilityFocused()})
    }
}
private class Utils{
    /**
     * NOTE: Reducing for-loops is a great way to maintain readability and maintain code modularity. Here is a trick were we use closure blocks to encapsulate the method call. The for loop is the same but the method call is different. This approach is great when you need the code within the for-loop to be the same but you want to have the code within different methods to be different
     */
    static func performAction(_ windows:[NSWindow], _ action:(NSWindow)->Bool)->NSWindow?{
        return windows.first(where: {action($0)})
    }
}
