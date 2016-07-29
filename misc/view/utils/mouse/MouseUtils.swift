import Cocoa

class MouseUtils {
    /**
     * Returns a Point for the mouse position in the coordinate space of the PARAM: view
     */
    class func point(view:NSView) -> CGPoint {
        return view.localPos()
    }
    //isOver
}
