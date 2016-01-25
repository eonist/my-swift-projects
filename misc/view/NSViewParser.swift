import Foundation

class NSViewParser {
    /**
     * Returns an array of all the children in @param displayObjectContainer that is of type @param classType
     * // :TODO: rename to childrenByClassType
     */
    func childrenOfType(view:NSView,classType:AnyClass)->Array<NSView> {
    var children:Array<> = [];
        
        for subView in view.subviews {
            subView.removeFromSuperview()
            if(subView is classType) children.push(subView);
        }
    
    return children;
    }
}
