import Cocoa

class View2:FlippedView {
    var isInteractive:Bool = true
    var hasHandCursor:Bool = false
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var wantsUpdateLayer:Bool {return true}//true enables the updateLayer to
    override init(frame:NSRect) {
        super.init(frame:frame)
        self.wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        self.layer!.masksToBounds = false//this is needed!!!
        addTrackingRect(self.bounds, owner: self, userData: nil, assumeInside: true)//This enables entered and exited events to fire //let focusTrackingAreaOptions:NSTrackingAreaOptions = [NSTrackingActiveInActiveApp,NSTrackingMouseEnteredAndExited,NSTrackingAssumeInside,NSTrackingInVisibleRect,NSTrackingEnabledDuringMouseDrag]//NSTrackingEnabledDuringMouseDrag to mine to make sure the rollover behaves still when dragging in and out of the area.//TODO: you may need to update trackingarea: - (void)updateTrackingAreas
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    override func mouseEntered( event: NSEvent){
        Swift.print("Button.mouseEntered: ")
    }
    /**
     * Handles actions and drawing states for the mouseExited event.
     */
    override func mouseExited(event: NSEvent){
        Swift.print("Button.mouseExited:")
    }
    override func layout() {
        Swift.print("View2.layout()")
        //self.layer = layer
        //layer?.backgroundColor = NSColor.redColor().CGColor
        /*
        
        */
        let layerA = CALayer()
        //layerA.bounds = CGRectMake(0, 0, 100, 100);//this doesnt matter
        layerA.frame = CGRectMake(20, 20, 100, 100);
        layerA.masksToBounds = false//finally it works
        //layerA.position = CGPointMake(10, 10);
        layerA.backgroundColor = NSColor.greenColor().CGColor
        layer!.addSublayer(layerA)
        
        let layerB = CALayer()
        layerB.frame = CGRectMake(-10, -10, 100, 100);
        layerB.backgroundColor = NSColor.orangeColor().CGColor
        layer!.addSublayer(layerB)
        //now try to add a sibling that somehow draws to cgcontext
        let layerC:CustomCALayer = CustomCALayer()
        layerC.frame = CGRectMake(150,150,50,50);
        //layerC.needsDisplayOnBoundsChange = true
        //layerC.needsDisplay()
        layerC.display()
        layerC.masksToBounds = false/*this seems to make the layer not clip to the frame*/
        layerC.shadowColor = NSColor.blackColor().CGColor;
        layerC.shadowOpacity = 1.0;
        layerC.shadowRadius = 5.0;
        layerC.shadowOffset = CGSizeMake(0, 3);
        //layerC.anchorPoint//this is the pivot for rotation and scaling, set it to the top left if needed
        
        layer!.addSublayer(layerC)
        
        let layerD = CustomLayer(NSColor.blueColor())
        layerD.frame = CGRect(120,120,50,50);
        layerD.display()
        //layerD.masksToBounds = false
        layer!.addSublayer(layerD)
        //then try to refresh the underlaying sibling cgcontext graphic
        
        //then figure out how you can make mouse over/out/down/up work with the CALayer scheme
    }
    /**
     * Called on init if wantsUpdateLayer is true and layer==nil
     * NOTE: It seems if you add layers here instead of in the init method, you get the benefit of updateing the sublayers whenever this method is called, right?
     */
    override func updateLayer() {//
        Swift.print("View2.updateLayer()")
    }
    override func mouseDown(theEvent: NSEvent) {
        Swift.print("mouse down")
        needsDisplay = true//should now call updatlayer, which it does.
        //self.hitTestFromViewRelativeToFrame(theEvent.locationInWindow)
        //Swift.print("mousePos: " + "\(mousePos)")
        //let mousePos:NSPoint = convertPoint(theEvent.locationInWindow, fromView: nil)/*converts the mouse pos from a wrongly flipped view to a correctly flipped view*/
        let hitLayer = layer!.hitTest(theEvent.locationInWindow)
        Swift.print("hitLayer: " + String(hitLayer))
        
    }
}