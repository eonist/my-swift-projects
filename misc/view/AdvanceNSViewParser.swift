import Cocoa

class AdvanceNSViewParser {
    /**
     * TODO: not optimized very well
     * Returns depths of every NSView instance in @param views
     */
    class func indicesOfViews(container:NSView,_ views:Array<NSView>) -> Array<[Int]> {
        var indices:Array<[Int]> = []
        for view : NSView in views {indices.append(NSViewParser.index(container, view)!)}/*<--This should be correct*/
        return indices
    }
    /**
     * Returns an NSView instance at @param index in @param container
     * @Note this function is recursive
     * TODO: rename index to map?, move to AdvanceDisplayObjectParser?
     */
    class func getAt(container:NSView?, _ index:Array<Int>) -> NSView? {
        if(index.count == 0 && container != nil) {
            Swift.print("a")
            return container!
        }
        else if(index.count == 1 && container!.numSubViews > 0) {
            Swift.print("b")
            return container?.getSubViewAt(index[0])!
        }
        else if(index.count > 1 && container!.numSubViews > 0 && container!.getSubViewAt(index[0])?.numSubViews > 0/*<--i'm unsure about this last assert*/) {
            Swift.print("c")
            return getAt(container!.getSubViewAt(index[0]),index.slice2(1,index.count))
        }
        else{
            Swift.print("d")
            return nil
        }
    }
}