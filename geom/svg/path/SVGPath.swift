import Foundation
/**
 * This class represents a regular svg path
 * // :TODO: you may want to add support for code like this: <path d="M30 100 Q 80 30, 100 100, 130 65, 200 80" /> but illustrator wont export this kind of syntax so not important right away
 */
class SVGPath :SVGGraphic{
   var commands : Array<String>//TODO:consider using Character rather than string, its faster!
   var parameters : Array<CGFloat>
   /**
    * @param commands (M/m, l/L, H/h, V/v, Z/z) (moveTo,lineTo,horizontalLineTo,verticalLineTo,closePath)
    * @param parameters (path data)
    * @Note: moveTo. Establish origin at point specified. Two parameters (x,y) giving current position
    * @Note: Straight line path from current position to point specified. Two parameters (x,y) giving position of the line end point which becomes the current position.
    * @Note: Horizontal line path from current position to point specified. Single parameter giving X-coordinate of the line end point. The Y-coordinate is the same as that of the previous current position. The new point becomes the current position.
    * @Note: Vertical line path from current position to point specified. Single parameter giving Y-coordinate of the line end point. The X-coordinate is the same as that of the previous current position. The new point becomes the current position.
    * @Note: closePath Straight line back to original point
    */
    init(_ commands:Array<String>, _ parameters:Array<CGFloat>, _ style:SVGStyle? = nil,_ id:String? = nil) {
      //Swift.print("SVGPath.init()")
      self.commands = commands;
      self.parameters = parameters;
      super.init(style,id);
    }
    /**
     * Draws a line for the stroke and a line for the fill (Since the flash api doesnt support non-closed fills)
     * TODO: Try to find a different way to find the boundingBox.origin for the linsehape.frame, this would be better for the cpu. as you could then have all code within the if statments
     */
    override func draw()  {
        //Swift.print("SVGPath.draw()");
        let path:CGMutablePathRef = SVGPathUtils.drawPath(CGPathCreateMutable(), commands, parameters);/*draws the fill*/
        let boundingBox:CGRect = CGPathGetPathBoundingBox(path)/*there is also CGPathGetPathBoundingBox, CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        /*fill*/
        if(style!.fill != nil){/*Fill*/
            fillShape.frame = boundingBox
            let offset = CGPoint(-boundingBox.x,-boundingBox.y)
            var offsetPath = path.copy()
            fillShape.path = CGPathModifier.translate(&offsetPath, offset.x, offset.y)
        }
        if(style!.stroke != nil){/*Line,checks if there is a stroke in style*/
            /*line*/
            let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(fillShape.path, style!)// + boundingBox.origin
            //Swift.print("strokeBoundingBox: " + "\(strokeBoundingBox)")
            let linePathOffset:CGPoint = PointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
            //Swift.print("linePathOffset: " + "\(linePathOffset)")
            lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
            lineShape.path = fillShape.path.copy()
            var lineOffsetPath = fillShape.path.copy()
            lineShape.path = CGPathModifier.translate(&lineOffsetPath, linePathOffset.x, linePathOffset.y)
        }
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}