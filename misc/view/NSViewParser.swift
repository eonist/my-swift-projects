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
     * NOTE: this may not work, untested, see the your other hirarchy code for a better solution
     */
    class func parents(view:NSView){
        var aView:NSView = view;
        while ((aView == aView.superview!)) {
            aView = aView.superview!
            Swift.print("aView: " + "\(aView)")
        }
    }
}
