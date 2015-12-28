import Foundation
class SVGGraphic : SVGView,ISVGGraphic{
    init(style:SVGStyle? = nil,id:String? = nil) {
        super.init(style!,id!);
        draw()
        
        //setNeedsDisplay = true//initiates everything
        //TODO: setup the Graphic instance
        
    }
    /**
     * Handles the call selector call from the Graphic instance
     */
    func handleSelector(){
        //TODO:complete this
        fill()
        line()
        
    }
    /**
     *
     */
    func fill(){
        beginFill();
        //stylizeFill()
    }
    /**
     *
     */
    func line(){
        applyLineStyle();
        //stylizeLine()
    }
    /**
     * @Note the default is to fill the graphic with black and draw no outline unless you specify some other combination of fill and stroke.
     * @Note Updates only if style exists and fill is a number
     */
    func beginFill(){
        //TODO:complete this
    }
    /**
     *
     */
    func applyLineStyle(){
        //TODO:complete this
    }
    /**
     * drawLine() and drawFill() sets the paths to the fillShape and the LineShape of the Graphic instance (we use Graphic class with 2 layers for stroke and fill so taht we can offset the stroke to be cenetered and not clipped, this requires some offseting of the strokePath so taht it is clipped correctly. We could set stroke unclipped on the layer directly but then we wouldnt have GradientStroke support, which svg needse)
     */
    func draw(){
        drawLine()
        drawFill()
    }
    func drawLine(){
        //fatalError("must be overriden in subclass")
    }
    func drawFill(){
        //fatalError("must be overriden in subclass")
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}