import Cocoa
/**
 * The BaseGraphic class is an Element DataObject class that holds the lineshape, lineStyle and fillStyle
 * TODO: ⚠️️ Possibly get rid of the setters for the fillStyle and Line style and use implicit setFillStyle and setLineStyle?  Don't bother this class will be rewamped when porting to iOS 
 * NOTE: We don't need a line mask, just subclass the Graphics class so it supports masking of the line aswell (will require some effort)
 */
class BaseGraphic:AbstractGraphic,GraphicDecoratableKind{/*Was extending AbstractGraphicDecoratable*/
    override var graphic:BaseGraphic {return self}
    /**
     * NOTE: Color can't be UInt since UInt can't be NaN, use Double as a differntiator
     */
    override func beginFill(){
        if let fillStyle = fillStyle, fillStyle.color != NSColor.clear{/*Updates only if fillStyle is of class FillStyle*/
            fillShape.graphics.fill(fillStyle.color)/*Stylize the fill*/
        }
    }
    override func stylizeFill(){
        GraphicsModifier.stylize(fillShape.path,fillShape.graphics)/*Realize style on the graphic*/
    }
    override func applyLineStyle() {
        if let lineStyle = lineStyle {/*Updates only if lineStyle of class LineStyle*/
            lineShape.graphics.line(lineStyle.thickness, lineStyle.color, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit,lineStyle.phase,lineStyle.lengths)
        }
    }
    override func stylizeLine(){
        GraphicsModifier.stylizeLine(lineShape.path,lineShape.graphics)/*Realize style on the graphic*/
    }
    override func getGraphic()->BaseGraphic{
        return self
    }
    override func getDecoratable()->GraphicDecoratableKind{return self}/*New*/
}
