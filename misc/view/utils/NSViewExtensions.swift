import Cocoa

extension NSView {
    /**
     * Asserts if locationInWindow is within the NSView frame
     * NOTE: seem to work different if the view isnt flipped (which some arent) try the alternate method with the "fromView" param
     */
    func hitTestToView(locationInWindow:NSPoint, _ toView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, toView: toView)
        return NSPointInRect(mousePos, frame)
    }
    func hitTestFromView(locationInWindow:NSPoint, _ fromView:NSView? = nil)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, fromView: fromView)
        return NSPointInRect(mousePos, frame)
    }
}
