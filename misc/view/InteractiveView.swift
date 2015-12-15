import Foundation

import Cocoa
/**
 * TODO: Make the isChildrenInteractive:Bool -> You may want to make a variable that also can set the isInteractive var of children of the view:
 * CAUTION: seems to not work as a container for i.e Adding a button to a View instance (for now use FlippedView when using it as a container)
 */
class InteractiveView:FlippedView{
    var isMouseOver:Bool = false;/*you should hit test this on init*/
    var hasMouseEntered:Bool = false/*you should hit test this on init*/
    var isInteractive:Bool = true//why is this here?
    var hasHandCursor:Bool = false
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var wantsUpdateLayer:Bool{return false;}
    override init(frame:NSRect) {
        super.init(frame:frame)
        self.wantsLayer = true//setting this to false avoids calling drawLayer() and enables drawingRect()
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
    override func mouseDown(theEvent: NSEvent) {
        //Swift.print(pos)
        Swift.print("mouseDown start")
        hitTest(winMousePos)
        Swift.print("mouseDown end")
    }
    /**
     * MouseMove (only fires when the mouse is actualy moving on the visible  part of the view)
     * NOTE: It could be possible to only call this method if a bool value was true. Optimization
     */
    func mouseMove(){
        //Swift.print(name + " mouseMove")
    }
    /**
     * Only fires if the mouse is over the visible part of this view
     */
    func mouseOver(){
        //override in subclass
    }
    /**
     * Only fires if the mouse is "rolls" out of the visible part of this view
     */
    func mouseOut(){
        //override in subclass
    }
    /**
     * MouseMoved
     */
    override func mouseMoved(theEvent: NSEvent) {
        //Swift.print("mouseMoved")
        if(hasMouseEntered){/*Only run the following code when inside the actual TrackingArea*/
            let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
            //Swift.print("theHitView: " + "\(theHitView)")
            if(theHitView === self){//mouse move on the "visible" part of the view
                if(!isMouseOver){mouseOver();isMouseOver = true;}
                mouseMove()
            }
            else if(isMouseOver){mouseOut();isMouseOver = false;}//mouse move on the "invisible" parth of the view
        }
    }
    /**
     * Fires when the mouse enters the tracking area, regardless if it is overlapping with other trackingAreas of other views
     */
    override func mouseEntered( event: NSEvent){
        //Swift.print("TempNSView.mouseEntered: ")
        hasMouseEntered = true/*optimization*/
        //Swift.print("theHitView: " + "\(theHitView)")
        if(viewUnderMouse === self){mouseOver();isMouseOver = true;}//mouse move on visible view
    }
    /**
     * Fires when the mouse exits the tracking area, regardless if it is overlapping with other trackingAreas of other views
     */
    override func mouseExited(event: NSEvent){
        //Swift.print("TempNSView.mouseExited:")
        hasMouseEntered = false/*optimization*/
        if(isMouseOver){mouseOut();isMouseOver = false;}
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