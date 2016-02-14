import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in @param view that is of type @param classType
     * // :TODO: rename to childrenByClassType, maybe not?
     * NOTE: this works with classes and protocols
     */
    class func childrenOfType<T>(view:NSView, _ type:T.Type)->Array<T> {
        var children:Array<T> = []
        for subView in view.subviews {
            if(subView as? T != nil){children.append(subView as! T)}
        }
        return children;
    }
    
    /**
     * Returns a list of parents (this works, tested)
     */
    class func parents(view:NSView)->Array<NSView>{
        var parents:Array<NSView> = []
        var parent:NSView? = view.superview// :TODO: seperate this into a check if its DO then that, if its Window then do that
        while(parent != nil) {//loops up the object hierarchy as long as the parent is a Element supertype
            ArrayModifier.unshift(&parents,parent!)
            parent = parent!.superview
        }
        return parents;
    }
    /**
     * Returns the index of @param subView in @param view, -1 if nothing is found
     */
    class func getSubViewAt(view:NSView,subView:NSView)->Int{
        for var i = 0; i < view.subviews.count; ++i{
            if(view.subviews[i] === subView){
                return i
            }
        }
        return -1
    }
}
