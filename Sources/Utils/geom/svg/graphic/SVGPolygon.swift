import Foundation
/**
 * Draws a polygon based on points, closes it self to the first point
 */
class SVGPolygon:SVGGraphic,SVGPolyLineKind{
    var points:[CGPoint]
    init(_ points:[CGPoint], _ style : SVGStyle? = nil, _ id : String? = nil) {
        self.points = points
        super.init(style, id)
    }
    /**
     * NOTE: Miter-limit is hard: you have the complete set of math tools to solve this in the reserach-paper named: BodySegment with acompaning file called BodySegment Tail Head etc. The code works.
     * NOTE: this method calls two sub methods so that SVGPolyLine can use this class as a base method
     */
    override func draw() {
        guard let style = style else {return}
        let boundingBox:CGRect = CGPointParser.rectangle(points)/*Fill, We need the bounding box in order to set the frame*/
        if style.fill != nil {/*Fill*/
            fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
            fillShape.frame = boundingBox/*The positioning happens in the frame*/
        }
        if style.stroke != nil {/*Line,checks if there is a stroke in style*/
            let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(fillShape.path, style)// + boundingBox.origin
            let linePathOffset:CGPoint = CGPointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
            lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
            lineShape.path = CGPathParser.polyLine(points,true,CGPoint(-boundingBox.x,-boundingBox.y) + linePathOffset)
        }
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
