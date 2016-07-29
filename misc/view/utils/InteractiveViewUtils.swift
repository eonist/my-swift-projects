import Cocoa

/**
 * Reasearch, these can be deprecated
 */
class InteractiveViewUtils{
    /**
     * This method finds the immediate origin. Aka the first descendant of current
     */
    func immediate(current:NSView,_ origin:NSView)->NSView{//origin may be a CALayer, test this later
        var view:NSView = origin
        while(view.superview != current) {
            view = view.superview!
        }
        return view;
    }
    /**
     * origin equals target or origin descendes from target
     * @param origin: the result of hitTest()
     * @param target: i.e button1 or slider or some other UI component.
     */
    func withinScope(origin:NSView,_ target:NSView)->Bool{
        return origin === target || origin.isDescendantOf(target)
    }
}