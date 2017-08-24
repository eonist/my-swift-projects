import Foundation
/**
 * This class represents a regular svg path
 * TODO: ⚠️️ you may want to add support for code like this: <path d="M30 100 Q 80 30, 100 100, 130 65, 200 80" /> but illustrator wont export this kind of syntax so not important right away
 */
class SVGPath:SVGGraphic{
   var commands:[String]//TODO:consider using Character rather than string, its faster!
   var parameters:[CGFloat]
   /**
    * PARAM: commands (M/m, l/L, H/h, V/v, Z/z) (moveTo,lineTo,horizontalLineTo,verticalLineTo,closePath)
    * PARAM: parameters (path data)
    * NOTE: moveTo. Establish origin at point specified. Two parameters (x,y) giving current position
    * NOTE: Straight line path from current position to point specified. Two parameters (x,y) giving position of the line end point which becomes the current position.
    * NOTE: Horizontal line path from current position to point specified. Single parameter giving X-coordinate of the line end point. The Y-coordinate is the same as that of the previous current position. The new point becomes the current position.
    * NOTE: Vertical line path from current position to point specified. Single parameter giving Y-coordinate of the line end point. The X-coordinate is the same as that of the previous current position. The new point becomes the current position.
    * NOTE: closePath Straight line back to original point
    */
    init(_ commands:[String], _ parameters:[CGFloat], _ style:SVGStyle? = nil,_ id:String? = nil) {
        self.commands = commands
        self.parameters = parameters
        super.init(style,id)
    }
    /**
     * Draws a line for the stroke and a line for the fill (Since the flash api doesnt support non-closed fills)
     * TODO: ⚠️️ Try to find a different way to find the boundingBox.origin for the linsehape.frame, this would be better for the cpu. as you could then have all code within the if statments
     */
    override func draw()  {
        let path:CGMutablePath = SVGPathUtils.drawPath(CGMutablePath(), commands, parameters);/*draws the fill*/
        guard let style = style, (style.fill != nil || style.stroke != nil) else {return}
        let boundingBox:CGRect = path.boundingBoxOfPath/*there is also CGPathGetPathBoundingBox, CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        if style.fill != nil {/*Fill*/
            fillShape.frame = boundingBox
            let offset = CGPoint(-boundingBox.x,-boundingBox.y)
            var offsetPath = path.clone()
            fillShape.path = CGPathModifier.translate(&offsetPath, offset.x, offset.y)
        }
        if style.stroke != nil {/*Line,checks if there is a stroke in style*/
            let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(fillShape.path, style)// + boundingBox.origin
            let linePathOffset:CGPoint = CGPointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
            lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
            lineShape.path = fillShape.path.clone()
            var lineOffsetPath = fillShape.path.clone()
            lineShape.path = CGPathModifier.translate(&lineOffsetPath, linePathOffset.x, linePathOffset.y)
        }
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
