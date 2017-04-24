import Cocoa

class AdvanceNSViewParser {
    /**
     * TODO: not optimized very well
     * Returns depths of every NSView instance in PARAM: views
     */
    static func indicesOfViews(_ container:NSView,_ views:[NSView]) -> [[Int]] {
        return views.map{NSViewParser.index(container, $0)!}
    }
    /**
     * Returns an NSView instance at PARAM: index in PARAM: container
     * NOTE: this function is recursive
     * TODO: rename index to map?, move to AdvanceDisplayObjectParser?
     */
    static func getAt(_ container:NSView?, _ index:[Int]) -> NSView? {
        if(index.count == 0 && container != nil) {
            Swift.print("a")
            return container!
        }
        else if(index.count == 1 && container!.numSubViews > 0) {
            Swift.print("b")
            return container?.getSubViewAt(index[0])!
        }
        //swift 3 upgraded the bellow line: you may need to add an additional assert, but maybe not
        else if(index.count > 1 && container!.numSubViews > 0 && container!.getSubViewAt(index[0])!.numSubViews > 0/*<--i'm unsure about this last assert*/) {
            Swift.print("c")
            return getAt(container!.getSubViewAt(index[0]),index.slice2(1,index.count))
        }
        else{
            Swift.print("d")
            return nil
        }
    }
}
