import Cocoa

class TempNSView :FlippedView{/*Organizes your view from top to bottom*/
    var name:String = ""/*Makes it easier to test*/
    var isMouseOver:Bool = false;/*you should hit test this on init*/
    var hasMouseEntered:Bool = false/*you should hit test this on init*/
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let trackingArea:NSTrackingArea = NSTrackingArea(rect: bounds, options: [NSTrackingAreaOptions.ActiveAlways, NSTrackingAreaOptions.MouseMoved,NSTrackingAreaOptions.MouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    /**
     * NOTE: this method is called from the root view if this view is the top-most visible view
     */
    override func hitTest(aPoint: NSPoint) -> NSView? {
        //Swift.print("hitTest")
        var pos = convertPoint(aPoint, toView: self)/*converts the p to local coordinates*/
        pos -= frame.origin/*converts the point from a global position to a local position*/
        //Swift.print("pos: " + "\(pos)")
        //Swift.print("containsPoint(p): " + String(NSPointInRect(pos + frame.origin, frame)))
        return NSPointInRect(pos + frame.origin, frame) ? self : nil
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    /**
     * MouseMoved
     */
    override func mouseMoved(theEvent: NSEvent) {
        //Swift.print("mouseMoved")
        if(hasMouseEntered){/*Only run the following code when inside the actual TrackingArea*/
            let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
            //Swift.print("theHitView: " + "\(theHitView)")
            if(theHitView === self){//mouse move on the "visible" part of the view
                if(!isMouseOver){mouseOver()}
                mouseMove()
            }
            else if(isMouseOver){mouseOut()}//mouse move on the "invisible" parth of the view
        }
    }
    /**
     * NOTE: draws a 100 by 100 square with a random color
     */
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("TempNSView.drawRect()")
        let graphicsContext = NSGraphicsContext.currentContext()!
        let context = graphicsContext.CGContext/* Get the handle to the current context */
        let path = CGRect(0,0,100,100).path
        CGContextAddPath(context, path)
        CGContextSetFillColorWithColor(context,NSColor.random.CGColor)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
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
        Swift.print(name + " mouseOver")
        isMouseOver = true
    }
    /**
     * Only fires if the mouse is "rolls" out of the visible part of this view
     */
    func mouseOut(){
        Swift.print(name + " mouseOut")
        isMouseOver = false
    }
    /**
     * Fires when the mouse enters the tracking area, regardless if it is overlapping with other trackingAreas of other views
     */
    override func mouseEntered( event: NSEvent){
        //Swift.print("TempNSView.mouseEntered: ")
        hasMouseEntered = true/*optimization*/
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        //Swift.print("theHitView: " + "\(theHitView)")
        if(theHitView === self){mouseOver()}//mouse move on visible view
    }
    /**
     * Fires when the mouse exits the tracking area, regardless if it is overlapping with other trackingAreas of other views
     */
    override func mouseExited(event: NSEvent){
        //Swift.print("TempNSView.mouseExited:")
        hasMouseEntered = false/*optimization*/
        if(isMouseOver){mouseOut()}
    }
    /**
     * MouseDown (for testing purposes)
     */
    override func mouseDown(theEvent: NSEvent) {
        Swift.print("TempNSView.mouseDown()")
        //Swift.print("window?.mouseLocationOutsideOfEventStream: " + "\(window?.mouseLocationOutsideOfEventStream)")
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        Swift.print("theHitView: " + "\(theHitView)")
    }
}