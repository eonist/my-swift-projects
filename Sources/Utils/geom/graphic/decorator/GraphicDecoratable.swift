import Cocoa
/**
 * Manifesto:
 * 1. This class should only provide access to the graphic instance
 * 2. Contain all the instructions to draw on to the graphic
 * NOTE: it should not contain style, size or position
 * TODO: Remove the getGraphics
 */
class GraphicDecoratable:AbstractGraphicDecoratable {
    var decoratable:GraphicDecoratableKind
    override var graphic:BaseGraphic {return decoratable.graphic}
    init(_ decoratable:GraphicDecoratableKind){
        self.decoratable = decoratable
        super.init()/*This doesn't init anything, its just needed to support the setting of self as delegate*/
        graphic.selector = self.handleSelector/*👈 Assigns the selector ⚠️️IMPORTANT⚠️️ It sort of ad-hocks it self down the decorator chain*/
    }
    /**
     * Setup the geometry and init the display process of fill and line
     * ⚠️️IMPORTANT⚠️️: It's the setNeedsDisplay tells the system to initiate the drawing. The system then decides when its apropriate to draw the graphic.
     */
    override func draw() {
        if getGraphic().fillStyle != nil {drawFill()}/*👈 setup the fill geometry, draw the fileShape*/
        graphic.fillShape.setNeedsDisplay()/*if the fillStyle is nil, we want the possible last drawing to disapear*/
        if getGraphic().lineStyle != nil {drawLine()}/*👈 setup the line geometry, draw the lineShape*/
        graphic.lineShape.setNeedsDisplay()
    }
    /**
     * This method starts the actual drawing of the path and style to the context (for fill and stroke)
     * NOTE: This method gets it's call from the Graphic instance through a functional selector. Which gets it's call through a instance selector. The call is fired when OSX deems it right to be fired. This is initiated by setNeedsDisplay calls on the line and the fill shape (This )
     */
    func handleSelector(layer:CALayer,ctx:CGContext) {
        //isDrawing = false//reset if(!isDrawing){}
        if layer === graphic.fillShape {
            graphic.fillShape.graphics.context = ctx/*we set the context so that the Graphics class can alter it, we can only get the ctx from this method*/
            if graphic.fillStyle != nil {fill()}
        }else if layer === graphic.lineShape {
            graphic.lineShape.graphics.context = ctx
            if graphic.lineStyle != nil {line()}
        }
    }
    /**
     * This method results in the actual drawing of the fill to the context
     * NOTE: Conceptually this is equvielnt to the line call
     */
    override func fill(){
        beginFill()
        stylizeFill()
    }
    /**
     * This method results in the setting of filling type to the graphics instance
     * NOTE: Conceptually this is equvielnt to the applyLineStyle call
     */
    override func beginFill(){
        decoratable.beginFill()
    }
    /**
     * This method results in the setting of the "fill-path" to the graphics instance
     */
    override func drawFill(){
        decoratable.drawFill()
    }
    /**
     * This method results the actual drawing of the fill to the context (based on what is attached on the graphics instance at the moment)
     */
    override func stylizeFill(){
        decoratable.stylizeFill()
    }
    /**
     * This method results in the actual drawing of the stroke to the context
     * NOTE: Conceptually this is equvielnt to the fill call
     */
    override func line(){
        applyLineStyle()
        stylizeLine()
    }
    /**
     * NOTE: Conceptually this is equvielnt to the beginFill call
     */
    override func applyLineStyle(){
        decoratable.applyLineStyle()
    }
    /**
     * This method results in the setting of the "line-path" to the graphics instance
     */
    override func drawLine(){
        decoratable.drawLine()
    }
    /**
     * This method results the actual drawing of the stroke to the context (based on what is attached on the graphics instance at the moment)
     */
    override func stylizeLine(){
        decoratable.stylizeLine()
    }
    /**
     * Returns _decoratable.graphic
     * NOTE: we use decoratable.graphic to get to the graphics object, regardless of how many layers of decorators above.
     * TODO: remove this if applicaple
     */
    override func getGraphic() -> BaseGraphic{
        return self.decoratable.getGraphic()
    }
    override func getDecoratable()->GraphicDecoratableKind{return decoratable}/*new*/
}
