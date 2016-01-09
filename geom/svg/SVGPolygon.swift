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
        Swift.print("SVGPolygon.drawFill()")
        
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
        Swift.print("fillShape.path: " + "\(fillShape.path)")
        fillShape.frame = boundingBox/*The positioning happens in the frame*/
        Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
        /*line*/
        
        
        //continue here: you need the code that calculates more space for the mask, you have the code for this, just look though some of the masking code from the old code
        //try to use the outline code that apple provides
        //then you try to get the bounding box of this outline
        lineShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x+(style!.strokeWidth/2),-boundingBox.y+(style!.strokeWidth/2)))
        
        let lineOffsetRect = RectGraphicUtils.lineOffsetRect(boundingBox, style!.strokeWidth, OffsetType(OffsetType.center))
        lineShape.frame = lineOffsetRect.lineFrameRect
        //TODO:The bellow should probably be optimized a bit better
        
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
private class Utils{
    /**
     * Returns the boundingBoc for the stroke
     */
    class func boundingBox(path:CGPath,_ style:SVGStyle){
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth)
        let outline = CGPathCreateCopyByStrokingPath(path, nil, strokeWidth, strokeLineCap, strokeLineJoin, strokeMiterLimit)
        
        let boundingBox:CGRect = CGPathGetPathBoundingBox()
    }
}