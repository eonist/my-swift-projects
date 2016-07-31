import Cocoa

class AdvanceNSViewModifier {
    /**
     * Adds an DisplayObject instance to @param displayObjectContainer at @param index (array index)
     * // :TODO: return the DisplayObject
     */
    class func addAt(container:NSView, item:NSView, index:Array<Int>) {
        if(index.count == 1) {container.addSubviewAt(item, index[0])}
        else if(index.count > 1 && DisplayObjectParser.getAt(container,index.slice(0,index.length-1)) is NSView){//<-- here you probably need to assert if NSView has children instead of an is assert
            (DisplayObjectParser.getAt(displayObjectContainer,index.slice(0,index.length-1)) as DisplayObjectContainer).addChildAt(displayObject, index[index.length-1])
        }
    }
}
