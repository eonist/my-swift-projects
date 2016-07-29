import Cocoa

/**
 * TODO: add to private utils class, maybe!?!?
 */
extension InteractiveView2{
    /**
     * Returns a correctly flipped coordinate of the mouse in window space 0,0
     * @NOTE: there may be a problem with this if the window has a titleBar, then the height of this may need to be included
     */
    var winMousePos:CGPoint {
        var pos = (window?.mouseLocationOutsideOfEventStream)!//convertPoint((window?.mouseLocationOutsideOfEventStream)!, fromView: nil)/*converts the p to local coordinates*/
        pos.y = WinParser.height(window!) - pos.y/*flips the window coordinates*/
        return pos
    }
    var viewUnderMouse:NSView?{
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        return theHitView
    }
}