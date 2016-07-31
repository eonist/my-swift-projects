import Cocoa

class AdvanceNSViewModifier {
    /**
     * Adds an DisplayObject instance to @param displayObjectContainer at @param index (array index)
     * // :TODO: return the DisplayObject
     */
    class func addAt(container:NSView, item:NSView, index:Array<Int>) {
        if(index.count == 1) {container.addSubviewAt(item, index[0])}
        else if(index.count > 1 && AdvanceNSViewParser.getAt(container,index.slice2(0,index.count-1))?.numSubViews > 0){//<-- the last assert is untested
            AdvanceNSViewParser.getAt(container,index.slice2(0,index.count-1))?.addSubviewAt(item, index[index.count-1])
        }
    }
}
