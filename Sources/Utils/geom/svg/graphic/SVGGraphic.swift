import Cocoa
/**
 * This is the base graphic class for the svg lib
 * NOTE: The basic drawing process in steps:
 * 1. You set the fill and stroke type and attributes to the Graphics instance (through the beginFill and applyLineStyle methods)
 * 2. You add the path to the Graphics instance (through the draw methods)
 * 3. You call the draw method in the Graphics instance (through the stylize methods)
 */
class SVGGraphic:SVGView,CALayerDelegate,ISVGGraphic{
    var fillShape:Shape
    var lineShape:Shape
    var trackingArea:NSTrackingArea?
    override init(_ style:SVGStyle? = nil,_ id:String? = nil) {
        fillShape = Shape()
        lineShape = Shape()
        super.init(style,id!)
        //wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        //layer = CALayer()//TempCALayer(layer: layer!)
        //layer!.masksToBounds = false//this is needed!!!
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        self.fillShape.delegate = self/*this is needed in order to be able to retrive the context and use it whithin the decoratable methods, or else the context would reside isolated inside the Graphic.fillShape, and Graphic.lineShape*/
        self.lineShape.delegate = self//swift 3 upgrade, the casting was not needed before
        //Swift.print("SVGGraphic.init() style: " + "\(style)")
        if(style != nil){/*this should porbably have a more complex assert for the sake of optimization*/
            draw()
            fillShape.setNeedsDisplay()/*setup the fill geometry*//*draw the fileShape*/
            lineShape.setNeedsDisplay()/*setup the line geometry*//*draw the fileShape*/
        }
    }
    
    /**
     * This method starts the actual drawing of the path and style to the context (for fill and stroke)
     * Handles the call selector call from the Graphic instance
     * NOTE: using the other delegate method "displayLayer" does not provide the context to work with. Trying to get context other ways also fail. This is the only method that works with layer contexts
     * NOTE: this is a delegate method for the shapes in Graphic
     * NOTE: This method gets its call from the Graphic instance through a functional selector. Which gets it's call through a instance selector. The call is fired when OSX deems it right to be fired. This is initiated by setNeedsDisplay calls on the line and the fill shape (This )
     */
    func draw(_ layer: CALayer, in ctx: CGContext) {/*The context is passed from the layers, so that we get access to the context from this class and the classes that inherit this class*/
        //Swift.print("SVGGraphic.drawLayer()")
        if(layer === fillShape){
            //Swift.print("fillShape: ")
            fillShape.graphics.context = ctx
            if(style != nil){fill()}
        }else if(layer === lineShape){
            //Swift.print("lineShape")
            lineShape.graphics.context = ctx
            if(style != nil){line()}
        }
    }
    func fill(){
        //Swift.print("SVGGraphic.fill()")
        beginFill()
        stylizeFill()
    }
    func line(){
        //Swift.print("SVGGraphic.line()")
        applyLineStyle()
        stylizeLine()
    }
    /**
     * NOTE: the default is to fill the graphic with black and draw no outline unless you specify some other combination of fill and stroke.
     * NOTE: Updates only if style exists and fill is a number
     * NOTE: we dont check to se if style is not nil, since that is being done by the caller of this method
     */
    func beginFill(){
        //Swift.print("SVGGraphic.beginFill()" + "\(style!.fill))")
        if(/*style != nil && */style!.fill is Double/* && style!.fill != "none"*/ && !(style!.fill as! Double).isNaN) {
            let color:NSColor = SVGFillStyleUtils.fillColor(style!)
            fillShape.graphics.fill(color)/*Stylize the fill*/
        }else if(style!.fill != nil && style!.fill! is SVGGradient){//<- may need to use dynamixtype to assert this?!?
            SVGGraphicModifier.beginGradientFill(fillShape, style!.fill as! SVGGradient)
        }else{
            //clear
            //Swift.print("no fill")
            //fatalError("not implemented yet")
        }
    }
    /**
     * NOTE: we dont check to see if style is not nil, since that is being done by the caller of this method
     */
    func applyLineStyle(){
        if(style!.stroke is Double) {/*updates only if lineStyle of class LineStyle*/
            SVGGraphicModifier.applyStrokeStyle(lineShape.graphics, style!)
        }else if(style!.stroke is SVGGradient){
            SVGGraphicModifier.applyGradientStrokeStyle(lineShape, style!)
        }else{/*clear*/
            //fatalError("not implemented yet " + "\(style!.stroke)")
        }
    }
    /**
     * The draw call is overriden in SVGRect SVGCircle etc and takes care of setting the path to the Shape instances
     */
    func draw(){
        //Swift.print("SVGGraphic.draw()")
        /*if(style != nil){/*this should porbably have a more complex assert for the sake of optimization*/
            drawLine()
            drawFill()
        }*/
        
    }
    
    /**
     * drawLine() and drawFill() sets the paths to the fillShape and the LineShape of the Graphic instance (we use Graphic class with 2 layers for stroke and fill so taht we can offset the stroke to be cenetered and not clipped, this requires some offseting of the strokePath so taht it is clipped correctly. We could set stroke unclipped on the layer directly but then we wouldnt have GradientStroke support, which svg needse)
     */
    /*
    func drawLine(){
        Swift.print("SVGGraphic.drawLine()")
        //fatalError("must be overriden in subclass")
    }
    func drawFill(){
        Swift.print("SVGGraphic.drawFill()")
        //fatalError("must be overriden in subclass")
    }
    */
    func stylizeFill(){
        //Swift.print("SVGGraphic.stylizeFill()")
        GraphicsModifier.stylize(fillShape.path,fillShape.graphics)//realize style on the graphic
    }
    func stylizeLine(){
        //Swift.print("SVGGraphic.stylizeLine()")
        GraphicsModifier.stylizeLine(lineShape.path,lineShape.graphics)//realize style on the graphic
    }
    /**
     * This is the last NSView so we dont forward the hitTest to further descendants, however we could forward the hit test one more step to the CALayer
     * TODO: the logic inside this method should be in the Shape, and this method should just forward to the shape
     */
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        //Swift.print("hitTest in graphic" + "\(aPoint)")
        //you have to convert the aPoint to localspace
        
        let localPoint = localPos()//convertPoint(aPoint, fromView: self.window?.contentView)//convertPoint(winMousePos, fromView: nil)//
        //Swift.print("localPoint: " + "\(localPoint)")
        //Swift 3 upgrade, caution used different contains method before, but the bellow should work
        let isPointInside:Bool = fillShape.path.contains(localPoint)//CGPathContainsPoint(fillShape.path,nil,,true)
        //Swift.print("isPointInside: " + "\(isPointInside)")
        
        return isPointInside ? self : nil/*return nil will tell the parent that there was no hit on this view*/
    }
    /**
     * NOTE: you should use bounds for the rect but we dont rotate the frame so we dont need to use bounds.
     * NOTE: the only way to update trackingArea is to remove it and add a new one
     * PARAM: owner is the instance that receives the interaction event
     * NOTE: we could keep the trackingArea in graphic so its always easy to access, but i dont think it needs to be easily accesible atm.
     */
    override func updateTrackingAreas() {
        //Swift.print("SVGGraphic.updateTrackingArea: " + "\(fillShape.frame)")
        //Swift.print("\(NSViewParser.parents(self))" + ".updateTrackingArea: " + "\(fillShape.frame)")
        if(trackingArea != nil) {self.removeTrackingArea(trackingArea!)}//remove old trackingArea if it exists
        trackingArea = NSTrackingArea(rect: fillShape.frame, options: [NSTrackingAreaOptions.activeAlways, NSTrackingAreaOptions.mouseMoved,NSTrackingAreaOptions.mouseEnteredAndExited], owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea!)//<---this will be in the Skin class in the future and the owner will be set to Element to get interactive events etc
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}