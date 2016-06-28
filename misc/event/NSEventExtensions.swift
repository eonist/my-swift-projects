import Cocoa

extension NSEvent {
    /**
     * Returns localPosition in a view (converts a global position to a local position)
     * TODO: hopefully this method also works if the view is not 0,0 in the window
     */
    func localPos(view:NSView)->CGPoint{
        return view.convertPoint(self.locationInWindow,fromView:nil)
    }
}