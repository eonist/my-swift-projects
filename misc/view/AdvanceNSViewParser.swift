import Cocoa

class AdvanceNSViewParser {
    /**
     * TODO: not optimized very well
     * Returns depths of every DisplayObject instance in @param displayObject
     */
    class func indicesOfViews(container:NSView,_ views:Array<NSView>) -> Array<[Int]> {
        var indices:Array<[Int]> = []
        for view : NSView in views {indices.append(NSViewParser.index(container, view)!)}/*<--This should be correct*/
        return indices
    }
}