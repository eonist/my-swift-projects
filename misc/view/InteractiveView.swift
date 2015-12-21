import Foundation

import Cocoa
/**
 * TODO: Make the isChildrenInteractive:Bool -> You may want to make a variable that also can set the isInteractive var of children of the view:
 * CAUTION: seems to not work as a container for i.e Adding a button to a View instance (for now use FlippedView when using it as a container)
 * NOTE: Remember to override the mouseDown method in subclasses if you want to add functionality to the mouseDown action
 * NOTE: Use mouseDragged method if you want to call a method while the mouse is dragged
 */
class InteractiveView:FlippedView{
    var isMouseOver:Bool = false;/*you should hit test this on init*/
    var hasMouseEntered:Bool = false/*you should hit test this on init*/
    var isInteractive:Bool = true//why is this here?
    var hasHandCursor:Bool = false
    //override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    //override var wantsUpdateLayer:Bool{return true;}
    override init(frame:NSRect) {
        super.init(frame:frame)
        self.wantsLayer = true//setting this to false avoids calling drawLayer() and enables drawingRect()
        layer = CALayer()
        layer!.masksToBounds = false
        let trackingArea:NSTrackingArea = NSTrackingArea(rect: bounds, options: [NSTrackingAreaOptions.ActiveAlways, NSTrackingAreaOptions.MouseMoved,NSTrackingAreaOptions.MouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    /**
     * Avoids covering the graphic behind when dealing with mouse down events
     * NOTE: the hitTestToView method makes sure the the mouseDown call isnt called if the mouseEvent.location is outside the view.frame
     */
    override func hitTest(aPoint: NSPoint) -> NSView? {
        //Swift.print("View.hitTest(): " + String(aPoint))
        //Swift.print("View.hitTestToView() " + String(hitTestToView(aPoint,self)))
        return isInteractive && hitTestToView(aPoint,self) ? self : nil
    }
    /**
     * Enables the hand cursor on enter
     */
    override func resetCursorRects() {
        if(hasHandCursor){
            let cursor:NSCursor = NSCursor.pointingHandCursor()
            addCursorRect(frame, cursor: cursor)
            cursor.setOnMouseEntered(true)
        }else{super.resetCursorRects()}
    }
    /**
     * MouseMove (only fires when the mouse is actualy moving on the visible  part of the view)
     * NOTE: It could be possible to only call this method if a bool value was true. Optimization
     */
    func mouseMove(){
         /*override in subclass*/
    }
    /**
     * Only fires if the mouse is over the visible part of this view
     */
    func mouseOver(){
        /*override in subclass*/
    }
    /**
     * Only fires if the mouse is "rolls" out of the visible part of this view
     */
    func mouseOut(){
        /*override in subclass*/
    }
    /**
     * Handles actions and drawing states for the release event.
     * @Note: bubbling= true was added to make Stepper class dragable
     */
    func mouseUpInside(theEvent: NSEvent){
        /*override in subclass*/
    }
    /**
     * Handles actions and drawing states for the mouseUpOutside event.
     * @Note: bubbling = true was added to make Stepper class dragable
     */
    func mouseUpOutside(theEvent: NSEvent){
       /*override in subclass*/
    }
    /**
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseUp(theEvent: NSEvent) {
        viewUnderMouse === self ? mouseUpInside(theEvent) : mouseUpOutside(theEvent);/*if the event was on this button call triggerRelease, else triggerReleaseOutside*/
        super.mouseUp(theEvent)/*passes on the event to the nextResponder, NSView parents etc*/
    }
    /**
     * MouseMoved
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseMoved(theEvent: NSEvent) {
        //Swift.print("InteractiveView.mouseMoved")
        if(hasMouseEntered){/*Only run the following code when inside the actual TrackingArea*/
            if(viewUnderMouse === self){//mouse move on the "visible" part of the view
                if(!isMouseOver){mouseOver();isMouseOver = true;}
                mouseMove()
            }
            else if(isMouseOver){mouseOut();isMouseOver = false;}//mouse move on the "invisible" parth of the view
        }
    }
    /**
     * Fires when the mouse enters the tracking area, regardless if it is overlapping with other trackingAreas of other views
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseEntered( event: NSEvent){
        Swift.print("InteractiveView.mouseEntered: " )//+ "\(viewUnderMouse)" + " self: " + "\(self)"
        hasMouseEntered = true/*optimization*/
        if(viewUnderMouse === self){mouseOver();isMouseOver = true;}//mouse move on visible view
        super.mouseEntered(event)/*passes on the event to the nextResponder, NSView parents etc*/
    }
    /**
     * Fires when the mouse exits the tracking area, regardless if it is overlapping with other trackingAreas of other views
     * NOTE: if you override this method in subclasses, then also call the the super of this method to avoid loss of functionality
     */
    override func mouseExited(event: NSEvent){
        Swift.print("InteractiveView.mouseExited:")
        hasMouseEntered = false/*optimization*/
        if(isMouseOver){mouseOut();isMouseOver = false;}
        super.mouseExited(event)/*passes on the event to the nextResponder, NSView parents etc*/
    }
}
extension InteractiveView{
    var winMousePos:CGPoint {
        var pos = (window?.mouseLocationOutsideOfEventStream)!//convertPoint((window?.mouseLocationOutsideOfEventStream)!, fromView: nil)/*converts the p to local coordinates*/
        pos.y = window!.frame.height - pos.y/*flips the window coordinates*/
        return pos
    }
    var viewUnderMouse:NSView?{
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        return theHitView
    }
}