import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in @param view that is of type @param classType
     * // :TODO: rename to childrenByClassType, maybe not?
     * NOTE: this works with classes and protocols
     */
    func childrenOfType<T>(view:NSView, type:T)->Array<T> {
        var children:Array<T> = []
        for subView in view.subviews {
            if(subView as? T != nil){children.append(subView as! T)}
        }
        return children;
    }
}
