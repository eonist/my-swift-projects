import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in @param view that is of type @param classType
     * // :TODO: rename to childrenByClassType, maybe not?
     */
    func childrenOfType(view:NSView,classType:A)->Array<NSView> {
        var children:Array<NSView> = []
        for subView in view.subviews {
            if(subView.isKindOfClass(classType)) {children.append(subView)}
        }
        return children;
    }
}
