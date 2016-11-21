import Foundation
/**
 * this is basically Polygon without the fill part
 */
class SVGPolyLine : SVGGraphic,ISVGPolyLine{
    var points:Array<CGPoint>
    init(_ points:Array<CGPoint>, _ style:SVGStyle? = nil, _ id : String? = nil) {
        self.points = points
        super.init(style, id)
    }
    override func beginFill() {
        //we override this method to avoid drawing a path in the fill shape
    }
    /**
     * NOTE: we dont call fill because we only need to draw a stroke
     */
    override func draw()  {
        Swift.print("SVGPolyline.draw" + "\(points)")
        //Continue here: you do not close the polyline,
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        Swift.print("boundingBox: " + "\(boundingBox)")
        let path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
        //Swift.print("fillShape.path: " + "\(fillShape.path)")
        //Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
        /*line*/
        let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(path, style!)// + boundingBox.origin
        //Swift.print("strokeBoundingBox: " + "\(strokeBoundingBox)")
        let linePathOffset:CGPoint = PointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
        Swift.print("linePathOffset: " + "\(linePathOffset)")
        //let lineOffsetRect = RectGraphicUtils.lineOffsetRect(strokeBoundingBox, style!.strokeWidth, OffsetType(OffsetType.center))
        lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
        lineShape.path = CGPathParser.lines(points,false,CGPoint(-boundingBox.x,-boundingBox.y) + linePathOffset)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}