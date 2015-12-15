import Cocoa

class TempNSView :FlippedView{
    var name:String = ""
    var isMouseOver:Bool = false;/*you should hit test this on init*/
    var hasMouseEntered:Bool = false/*you should hit test this on init*/
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let trackingArea:NSTrackingArea = NSTrackingArea(rect: bounds, options: [NSTrackingAreaOptions.ActiveAlways, NSTrackingAreaOptions.MouseMoved,NSTrackingAreaOptions.MouseEnteredAndExited], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    override func hitTest(aPoint: NSPoint) -> NSView? {
        //Swift.print("hitTest")
        var pos = convertPoint(aPoint, toView: self)/*converts the p to local coordinates*/
        pos -= frame.origin
        //Swift.print("pos: " + "\(pos)")
        //Swift.print("containsPoint(p): " + String(NSPointInRect(pos + frame.origin, frame)))
        return NSPointInRect(pos + frame.origin, frame) ? self : nil
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    /**
     * MouseMoved
     * NOTE: You need to silently check for if you re-enter the visible shape so you cant stop checking if you rolled over!!!
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
     */
    func mouseMove(){
        //Swift.print(name + " mouseMove")
    }
    override func mouseDown(theEvent: NSEvent) {
        Swift.print("TempNSView.mouseDown()")
        //Swift.print("window?.mouseLocationOutsideOfEventStream: " + "\(window?.mouseLocationOutsideOfEventStream)")
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        Swift.print("theHitView: " + "\(theHitView)")
    }
    func mouseOver(){
        Swift.print(name + " mouseOver")
        isMouseOver = true
    }
    func mouseOut(){
        Swift.print(name + " mouseOut")
        isMouseOver = false
    }
    override func mouseEntered( event: NSEvent){
        //Swift.print("TempNSView.mouseEntered: ")
        hasMouseEntered = true/*optimization*/
        let theHitView = window!.contentView?.hitTest((window?.mouseLocationOutsideOfEventStream)!)
        //Swift.print("theHitView: " + "\(theHitView)")
        if(theHitView === self){mouseOver()}//mouse move on visible view
    }
    override func mouseExited(event: NSEvent){
        //Swift.print("TempNSView.mouseExited:")
        hasMouseEntered = false/*optimization*/
        if(isMouseOver){mouseOut()}
    }
}


