import Cocoa

extension NSView {
    /**
     * Asserts if locationInWindow is within the NSView frame
     */
    func hitTestPoint(locationInWindow:NSPoint)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, toView: self)
        return NSPointInRect(mousePos, frame)
    }
}
