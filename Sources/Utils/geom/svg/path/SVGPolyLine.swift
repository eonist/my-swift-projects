import Foundation
/**
 * This is basically Polygon without the fill part
 */
class SVGPolyLine:SVGGraphic,SVGPolyLineKind{
    var points:[CGPoint]
    init(_ points:[CGPoint], _ style:SVGStyle? = nil, _ id:String? = nil) {
        self.points = points
        super.init(style, id)
    }
    override func beginFill() {
        /*we override this method to avoid drawing a path in the fill shape*/
    }
    /**
     * NOTE: We don't call fill because we only need to draw a stroke
     * TODO: ⚠️️ You do not close the polyline?!?!?
     */
    override func draw()  {
        let boundingBox:CGRect = CGPointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        let path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
        /*line*/
        guard let style = style else {return}
        let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(path, style)// + boundingBox.origin
        let linePathOffset:CGPoint = CGPointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
        //let lineOffsetRect = RectGraphicUtils.lineOffsetRect(strokeBoundingBox, style!.strokeWidth, OffsetType(OffsetType.center))
        lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
        lineShape.path = CGPathParser.lines(points,false,CGPoint(-boundingBox.x,-boundingBox.y) + linePathOffset)
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
