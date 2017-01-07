import Cocoa

/**
 * TODO: add to private utils class, maybe!?!?
 */
extension InteractiveView2{
    /**
     * Returns a correctly flipped coordinate of the mouse in window space 0,0
     * NOTE: there may be a problem with this if the window has a titleBar, then the height of this may need to be included
     */
    var winMousePos:CGPoint {
        var pos = (window?.mouseLocationOutsideOfEventStream)!//convertPoint((window?.mouseLocationOutsideOfEventStream)!, fromView: nil)/*converts the p to local coordinates*/
        pos.y = WinParser.height(window!) - pos.y/*flips the window coordinates*/
        return pos
    }
    //Debugging this at the moment, should still be correct, roll back if there are bugs popping up els where
    var viewUnderMouse:NSView?{
        //Swift.print("window: " + "\(window)")
        //Swift.print("window?.mouseLocationOutsideOfEventStream: " + "\(window?.mouseLocationOutsideOfEventStream)")
        let theHitView:NSView? = window?.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        return theHitView
    }
}