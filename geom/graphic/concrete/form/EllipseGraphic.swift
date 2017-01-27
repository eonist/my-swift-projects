import Cocoa
/**
 * NOTE: Dont create a circle class, ellipse will do the same as a circle
 * NOTE: EllipseGraphic is drawn from topLeft
 * TODO: possibly add a diameter var
 */
class EllipseGraphic:SizeableGraphic{
    override func drawFill() {
        let fillFrame = graphic.lineStyle != nil ?  RectGraphicUtils.fillFrame(CGRect(x,y,width,height), graphic.lineStyle!.thickness, graphic.lineOffsetType) : CGRect(x,y,width,height)
        graphic.fillShape.frame = fillFrame/*,position and set the size of the frame*/
        graphic.fillShape.path = CGPathParser.ellipse(CGRect(0,0,width,height))
    }
    override func drawLine() {
        let lineOffsetRect = RectGraphicUtils.lineOffsetRect(CGRect(x,y,width,height), graphic.lineStyle!.thickness, graphic.lineOffsetType)
        graphic.lineShape.frame = lineOffsetRect.lineFrameRect
        graphic.lineShape.path = CGPathParser.ellipse(lineOffsetRect.lineRect)
    }
}