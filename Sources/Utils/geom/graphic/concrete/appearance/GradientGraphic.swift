import Cocoa
/*
 * NOTE: Use FillStyleUtils.beginGradientFill(_gradientRect.graphic.graphics, _gradient); if you need to modifiy
 * NOTE: there may not be a need to include a getter function for the fillStyle, since if this instance is edited with a Utility class the new fillstyle is applied but not stored in _fillStyle, same goes for lineStyle
 * TODO: why isnt this a decorator? if you find the answere then add to a NOTE: in this description
 * TODO: look into making ISIzeableGraohic and IPositionalGraphic again that extends the functionality you need but doesnt have the init stuff
 */
class GradientGraphic:SizeableDecorator/*<--Recently changed from GraphicDecoratable, and then changed to SizeableDec..was positionalDec etc, then changed back to positional, then changed to SizeableDecorator again after a bug surfaced*/ {//TODO: probably should extend SizeableDecorator, so that we can resize the entire Decorator structure
    override func beginFill(){
        if let fillStyle:GradientFillStyleKind = graphic.fillStyle as? GradientFillStyleKind{
            let gradient = fillStyle.gradient
            //swift 3 update on the bellow line. used CGPathGetBoundingBox....etc
            let boundingBox:CGRect = graphic.fillShape.path.boundingBox /*creates a boundingbox derived from the bounds of the path*/
            let graphicsGradient:GraphicsGradientKind = GradientUtils.graphicsGradient(boundingBox, gradient)
            graphic.fillShape.graphics.gradientFill(graphicsGradient)
        }else{
            super.beginFill()/*Do regular color fill*/
        }//fatalError("NOT CORRECT fillStyle")
    }
    /**
     * NOTE: We could renamed this method to applyGradientLinestyle, but as it needs to override it can't be renamed!
     */
    override func applyLineStyle() {
        super.applyLineStyle()/*Call the BaseGraphic to set the stroke-width, cap, joint etc*/
        if let lineStyle:GradientLineStylable = getGraphic().lineStyle as?  GradientLineStylable{
            let gradient:GradientKind = lineStyle.gradient
            //swift 3 update on the bellow line. used CGPathGetBoundingBox....etc
            var boundingBox:CGRect = graphic.lineShape.path.boundingBox /*this method can be moved up one level if its better for performance, but wait untill you impliment matrix etc*/
            boundingBox = boundingBox.outset(graphic.lineStyle!.thickness/2, graphic.lineStyle!.thickness/2)/*Outset the boundingbox to cover the entire stroke*/
            
            //TODO: The above isn't totally correct, use the outline-stroke method and then get the boundingbox from that, think different caps etc
            
            let graphicsGradient:GraphicsGradientKind = GradientUtils.graphicsGradient(boundingBox, gradient)
            graphic.lineShape.graphics.gradientLine(graphicsGradient)
        }//else{fatalError("NOT CORRECT lineStyle")}
    }
}

