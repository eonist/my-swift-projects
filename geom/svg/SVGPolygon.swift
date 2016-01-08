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
    override func draw() {
        Swift.print("SVGPolygon.drawFill()")
        
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
        Swift.print("fillShape.path: " + "\(fillShape.path)")
        fillShape.frame = boundingBox/*The positioning happens in the frame*/
        Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
        /*line*/
        let lineOffsetRect = RectGraphicUtils.lineOffsetRect(boundingBox, style!.strokeWidth, OffsetType(OffsetType.center))
        lineShape.frame = lineOffsetRect.lineFrameRect
        lineShape.path = fillShape.path.copy()
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}