import Cocoa

class NSViewParser {
    /**
     * Returns an array of all the children in @param view that is of type @param classType
     * // :TODO: rename to childrenByClassType, maybe not?
     */
    func childrenOfType(view:NSView, classType:AnyClass?, protocolType:Protocol?)->Array<NSView> {
        var children:Array<NSView> = []
        for subView in view.subviews {
            let isOfClassType:Bool = classType != nil && subView.isKindOfClass(classType!)
            let isOfProtocolType:Bool = String(subView.dynamicType) == NSStringFromProtocol(protocolType!)
            if(isOfClassType && isOfProtocolType) {children.append(subView)}
        }
        return children;
    }
}
