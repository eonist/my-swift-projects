import Cocoa

extension NSView {
    /**
     * Asserts if locationInWindow is within the NSView frame
     */
    func hitTestPoint(locationInWindow:NSPoint)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, fromView: nil)
        return NSPointInRect(mousePos, frame)
    }
}
