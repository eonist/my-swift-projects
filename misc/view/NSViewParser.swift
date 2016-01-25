import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in @param view that is of type @param classType
     * // :TODO: rename to childrenByClassType, maybe not?
     */
    func childrenOfType(view:NSView,classType:AnyClass)->Array<NSView> {
        var children:Array<NSView> = []
        
        for subView in view.subviews {
            subView.removeFromSuperview()
            if(subView is classType) {children.append(subView)}
        }
        return children;
    }
}
