import Cocoa

extension NSView {
    /**
     *
     */
    func hitTestPoint(locationInWindow:NSPoint)->Bool{
        let mousePos:NSPoint = convertPoint(locationInWindow, fromView: nil)
        return NSPointInRect(mousePos, frame)
    }
}
