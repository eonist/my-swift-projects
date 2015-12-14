import Cocoa

class View2:FlippedView {
    var isInteractive:Bool = true
    var hasHandCursor:Bool = false
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override var wantsUpdateLayer:Bool {return true}//true enables the updateLayer to
    override init(frame:NSRect) {
        super.init(frame:frame)
        self.wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
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
        layerC.frame = CGRectMake(150,150,  150, 150);
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
        //let mousePos = self.hitTestFromViewRelativeToFrame(theEvent.locationInWindow)
        //Swift.print("mousePos: " + "\(mousePos)")
        let hitLayer = layer!.hitTest(theEvent.locationInWindow)
        Swift.print("hitLayer: " + String(hitLayer))
    }
}

class CustomCALayer:CALayer{
    var color:NSColor = NSColor.magentaColor()
    override init() {
        super.init()
        
    }
    /*
    override func containsPoint(p: CGPoint) -> Bool {
    Swift.print("CustomCALayer.containsPoint")
    return true
    }
    */
    override init(layer: AnyObject) {
        Swift.print("CustomCALayer.init(_layer_)")
        super.init(layer: layer)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(_ color:NSColor){
        self.color = color
        super.init()
    }
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("CustomCALayer.drawLayer")
        super.drawLayer(layer,inContext: ctx)
    }
    /**/
    override func drawInContext(ctx: CGContext) {
        Swift.print("CustomCALayer.drawInContext()")
        let context = ctx
        let path:CGMutablePathRef  = CGPathCreateMutable();
        /* Here are our rectangle boundaries */
        let rectangle:CGRect = CGRectMake(0.0, 0.0, 50.0, 50.0);
        //let circle:CGEl
        /* Add the rectangle to the path */
        CGPathAddRect(path,nil, rectangle);
        
        //CGContextAddArc(context, circleCenter.x, circleCenter.y, circleRadius,startingAngle, endingAngle, 0);
        
        CGContextDrawPath(context, CGPathDrawingMode.Fill);
        CGContextAddPath(context,path)
        
        
        
        CGContextSaveGState(context)
        /*offset,blur and color*/
        
        
        
        
        
        //CGContextSetShadowWithColor(context, CGSizeMake(-14, -14), 17.0, NSColor.grayColor().CGColor);//offset,bl
        
        
        //CGContextSetRGBFillColor(
        //CGContextStrokePath(context)
        CGContextSetFillColorWithColor(context,color.CGColor)
        //CGContextSetStrokeColorWithColor(context, NSColor.blueColor().CGColor)
        //set the stroke width!
        //CGContextSetLineWidth(context, 15.0)
        CGContextDrawPath(context, CGPathDrawingMode.Fill)
        CGContextRestoreGState(context);
        /*
        let l = self
        l.backgroundColor = NSColor.greenColor().CGColor
        //l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth = 4
        l.cornerRadius = 8
        
        l.borderColor = NSColor.redColor().CGColor
        
        //l.borderColor = UIColor.redColor().CGColor
        
        l.shadowOpacity = 0.7
        l.shadowOffset = CGSizeMake(0, 3);
        l.shadowRadius = 5.0;
        l.shadowColor = NSColor.grayColor().CGColor
        l.shadowOpacity = 0.8;
        */
    }
    /*
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
    Swift.print("CustomCALayer.drawLayer")
    super.drawLayer(layer, inContext: ctx)
    }
    override func display() {
    Swift.print("CustomCALayer.display()")
    super.display()
    }
    override func displayIfNeeded() {
    Swift.print("CustomCALayer.displayIfNeeded()")
    super.displayIfNeeded()
    }
    */
    /**/
    
    override func hitTest(p: CGPoint) -> CALayer? {
        Swift.print("p: " + String(p))
        self.hitTestFromViewRelativeToFrame(p,frame)//theEvent.locationInWindow
        Swift.print("containsPoint(p): " + String(containsPoint(p)))
        
        return self
    }
}


