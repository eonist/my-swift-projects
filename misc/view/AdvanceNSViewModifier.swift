import Cocoa

class AdvanceNSViewModifier {
    /**
     * Adds an DisplayObject instance to PARAM: displayObjectContainer at PARAM: index (array index)
     * TODO: return the DisplayObject
     */
    static func addAt(container:NSView, _ item:NSView, _ index:Array<Int>) {
        if(index.count == 1) {container.addSubviewAt(item, index[0])}
        else if(index.count > 1 && AdvanceNSViewParser.getAt(container,index.slice2(0,index.count-1))?.numSubViews > 0){//<-- the last assert is untested
            AdvanceNSViewParser.getAt(container,index.slice2(0,index.count-1))?.addSubviewAt(item, index[index.count-1])
        }
    }
}
