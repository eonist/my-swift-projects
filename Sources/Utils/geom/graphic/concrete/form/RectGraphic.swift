import Cocoa
/**
 * NOTE: The reason this class extends SizeableGraphic and not SizeableDecorator is because SizeableDecorator doesnt hold any size, it merly passes the size that the instance it decorates holds. Same goes for PositionalDecorator
 * TODO: ⚠️️ Add support for DashedLineStyle
 * TODO: ⚠️️ Needs x and y as arguments, or does it?, in the future this will be supported via fillOffset
 * TODO: ⚠️️ We need value based fillOffset (reasearch this)
 * TODO: ⚠️️ LineOffset could also use values (Think tank this)
 * TODO: ⚠️️ Should beginFill have parameters or does this clutter up the decoration chain?
 * TODO: ⚠️️ Could it rather extend a class called DecoratableGraphic and this class could have the decorator stuff and even extend graphic which could ahve the lineoffset stuff?
 */
class RectGraphic:SizeableGraphic{
    /**
     * TODO: Make the CGRect(x,y,width,height) into a variable on the Graphic class
     */
    override func drawFill() {
        graphic.fillShape.path = CGRect(0,0,width,height).path/*Draws in the local coordinate space of the shape*/
        let fillFrame:CGRect = {
            guard let lineStyle = graphic.lineStyle else {return CGRect(x,y,width,height)}
            return RectGraphicUtils.fillFrame(CGRect(x,y,width,height), lineStyle.thickness, graphic.lineOffsetType)
        }()
        graphic.fillShape.frame = fillFrame/*Position and set the size of the frame*/
    }
    override func drawLine(){
        if let lineStyle = graphic.lineStyle {/*<---TODO: I don't think this check is needed, as this check is already done in the GraphicDecoratable class, so remove it when your working with this again*/
            let lineOffsetRect:RectGraphicUtils.LineOffset = RectGraphicUtils.lineOffsetRect(CGRect(x,y,width,height), lineStyle.thickness, graphic.lineOffsetType)
            graphic.lineShape.frame = lineOffsetRect.lineFrameRect
            graphic.lineShape.path = lineOffsetRect.lineRect.path
        }
    }
}
