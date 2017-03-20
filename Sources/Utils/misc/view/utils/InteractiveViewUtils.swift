import Cocoa

/**
 * Research, these can be deprecated
 */
class InteractiveViewUtils{
    /**
     * This method finds the immediate origin. Aka the first descendant of current
     * ⚠️️ Are these in use?
     */
    func immediate(current:NSView,_ origin:NSView)->NSView{//origin may be a CALayer, test this later
        var view:NSView = origin
        while(view.superview != current) {
            view = view.superview!
        }
        return view
    }
    /**
     * Origin equals target or origin descendes from target
     * PARAM: origin: the result of hitTest()
     * PARAM: target: i.e button1 or slider or some other UI component.
     * ⚠️️ Are these in use?
     */
    func withinScope(origin:NSView,_ target:NSView)->Bool{
        return origin === target || origin.isDescendant(of: target)
    }
}
