import Foundation
/**
 * Draws a polygon based on points, closes it self to the first point
 */
class SVGPolygon:SVGGraphic,ISVGPolyLine{
    var points : Array<CGPoint>;
    init(_ points:Array<CGPoint>, _ style : SVGStyle? = nil, _ id : String? = nil) {
        self.points = points;
        super.init(style, id);
    }
    /**
     * NOTE: Miter-limit is hard: you have the complete set of math tools to solve this in the reserach-paper named: BodySegment with acompaning file called BodySegment Tail Head etc. The code works.
     */
    override func draw() {
        drawFill()
        drawLine()
    }
    /**
     *
     */
    func drawFill(){
        //Swift.print("SVGPolygon.drawFill()")
        
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
        //Swift.print("fillShape.path: " + "\(fillShape.path)")
        fillShape.frame = boundingBox/*The positioning happens in the frame*/
        //Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
        
    }
    /**
     *
     */
    func drawLine(){
        /*line*/
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        
        let strokeBoundingBox:CGRect = Utils.boundingBox(fillShape.path, style!)// + boundingBox.origin
        //Swift.print("strokeBoundingBox: " + "\(strokeBoundingBox)")
        
        let linePathOffset:CGPoint = PointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
        //Swift.print("linePathOffset: " + "\(linePathOffset)")
        
        //let lineOffsetRect = RectGraphicUtils.lineOffsetRect(strokeBoundingBox, style!.strokeWidth, OffsetType(OffsetType.center))
        lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
        lineShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y) + linePathOffset)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
private class Utils{
    /**
     * Returns the boundingBox for the stroke in 0,0 space
     */
    class func boundingBox(path:CGPath,_ style:SVGStyle)->CGRect{
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth)
        let outlinePath = CGPathCreateCopyByStrokingPath(path, nil, strokeWidth, strokeLineCap, strokeLineJoin, strokeMiterLimit)
        let boundingBox:CGRect = CGPathGetPathBoundingBox(outlinePath)/*there is also CGPathGetBoundingBox, which works a bit different*/
        return boundingBox
    }
}