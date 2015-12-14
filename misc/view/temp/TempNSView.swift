import Cocoa

class TempNSView :FlippedView{
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let trackingArea = NSTrackingArea(rect: self.bounds,
            options: [NSTrackingAreaOptions.ActiveWhenFirstResponder,NSTrackingAreaOptions.MouseEnteredAndExited],
            owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
        //addTrackingRect(self.bounds, owner: self, userData: nil, assumeInside: true)//This enables entered and exited events to fire //let focusTrackingAreaOptions:NSTrackingAreaOptions = [NSTrackingActiveInActiveApp,NSTrackingMouseEnteredAndExited,NSTrackingAssumeInside,NSTrackingInVisibleRect,NSTrackingEnabledDuringMouseDrag]//NSTrackingEnabledDuringMouseDrag to mine to make sure the rollover behaves still when dragging in and out of the area.//TODO: you may need to update trackingarea: - (void)updateTrackingAreas
    }

    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
        
    
    override func drawRect(dirtyRect: NSRect) {
        Swift.print("TempNSView.drawRect()")
        let graphicsContext = NSGraphicsContext.currentContext()!
        let context = graphicsContext.CGContext/* Get the handle to the current context */
        let path = CGRect(0,0,100,100).path
        CGContextAddPath(context, path)
        CGContextSetFillColorWithColor(context,NSColor.random.CGColor)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
    }
    override func mouseEntered( event: NSEvent){
        Swift.print("TempNSView.mouseEntered: ")
    }
    override func mouseExited(event: NSEvent){
        Swift.print("TempNSView.mouseExited:")
    }
}
