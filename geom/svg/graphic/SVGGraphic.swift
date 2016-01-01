import Cocoa
/**
 * This is the base graphic class for the svg lib
 * NOTE: The basic drawing process in steps:
 * 1. You set the fill and stroke type and attributes to the Graphics instance
 * 2. You add the path to the Graphics instance
 * 3. You call the draw method in the Graphics instance
 */
class SVGGraphic : SVGView,ISVGGraphic{
    lazy var fillShape:Shape = Shape()
    lazy var lineShape:Shape = Shape()
    override init(_ style:SVGStyle? = nil,_ id:String? = nil) {
        super.init(style!,id!);
        wantsLayer = true//this avoids calling drawLayer() and enables drawingRect()
        layer = CALayer()//TempCALayer(layer: layer!)
        layer!.masksToBounds = false//this is needed!!!
        layer?.addSublayer(fillShape)
        layer?.addSublayer(lineShape)
        self.fillShape.delegate = self/*this is needed in order to be able to retrive the context and use it whithin the decoratable methods, or else the context would reside isolated inside the Graphic.fillShape, and Graphic.lineShape*/
        self.lineShape.delegate = self
        applyLineStyle();
        beginFill();
        if(style != nil){
            drawFill();fillShape.setNeedsDisplay();/*setup the fill geometry*//*draw the fileShape*/
            drawLine();lineShape.setNeedsDisplay();/*setup the line geometry*//*draw the fileShape*/
        }
    }
    /**
     * This method starts the actual drawing of the path and style to the context (for fill and stroke)
     * Handles the call selector call from the Graphic instance
     * NOTE: using the other delegate method "displayLayer" does not provide the context to work with. Trying to get context other ways also fail. This is the only method that works with layer contexts
     * NOTE: this is a delegate method for the shapes in Graphic
     * NOTE: This method gets its call from the Graphic instance through a functional selector. Which gets its call through a instance selector. The call is fired when OSX deems it right to be fired. This is initiated by setNeedsDisplay calls on the line and the fill shape (This )
     */
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("SVGGraphic.drawLayer()")
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
    /**
     *
     */
    func fill(){
        Swift.print("SVGGraphic.fill()")
        beginFill();
        //stylizeFill()
    }
    /**
     *
     */
    func line(){
        Swift.print("SVGGraphic.line()")
        applyLineStyle();
        //stylizeLine()
    }
    /**
     * @Note the default is to fill the graphic with black and draw no outline unless you specify some other combination of fill and stroke.
     * @Note Updates only if style exists and fill is a number
     */
    func beginFill(){
        Swift.print("SVGGraphic.beginFill()")
        //TODO:complete this
    }
    /**
     *
     */
    func applyLineStyle(){
        Swift.print("SVGGraphic.applyLineStyle()")
        //TODO:complete this
    }
    /**
     * drawLine() and drawFill() sets the paths to the fillShape and the LineShape of the Graphic instance (we use Graphic class with 2 layers for stroke and fill so taht we can offset the stroke to be cenetered and not clipped, this requires some offseting of the strokePath so taht it is clipped correctly. We could set stroke unclipped on the layer directly but then we wouldnt have GradientStroke support, which svg needse)
     */
     /*
     func draw(){
     drawLine()
     drawFill()
     }
     */
    func drawLine(){
        Swift.print("SVGGraphic.drawLine()")
        //fatalError("must be overriden in subclass")
    }
    func drawFill(){
        Swift.print("SVGGraphic.drawFill()")
        //fatalError("must be overriden in subclass")
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}