import Cocoa

class MouseUtils {
    /**
     * Returns a Point for the mouse position in the coordinate space of the PARAM: view
     * NOTE: use window.content.localPos() to get position in a window
     */
    static func point(_ view:NSView) -> CGPoint {
        return view.localPos()
    }
}
