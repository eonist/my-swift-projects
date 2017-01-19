import Foundation
/**
 * Draws a polygon based on points, closes it self to the first point
 */
class SVGPolygon:SVGGraphic,ISVGPolyLine{
    var points:Array<CGPoint>
    init(_ points:Array<CGPoint>, _ style : SVGStyle? = nil, _ id : String? = nil) {
        self.points = points
        super.init(style, id)
    }
    /**
     * NOTE: Miter-limit is hard: you have the complete set of math tools to solve this in the reserach-paper named: BodySegment with acompaning file called BodySegment Tail Head etc. The code works.
     * NOTE: this method calls two sub methods so that SVGPolyLine can use this class as a base method
     */
    override func draw() {
        //Swift.print("SVGPolygon.draw()")
        /*Fill*/
        let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
        //Swift.print("boundingBox: " + "\(boundingBox)")
        if(style!.fill != nil){/*Fill*/
            fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))/*<--We offset so that the lines draw from 0,0 relative to the frame*/
            //Swift.print("fillShape.path: " + "\(fillShape.path)")
            fillShape.frame = boundingBox/*The positioning happens in the frame*/
            //Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
            /*line*/
        }
        if(style!.stroke != nil){/*Line,checks if there is a stroke in style*/
            let strokeBoundingBox:CGRect = SVGStyleUtils.boundingBox(fillShape.path, style!)// + boundingBox.origin
            //Swift.print("strokeBoundingBox: " + "\(strokeBoundingBox)")
            let linePathOffset:CGPoint = PointParser.difference(strokeBoundingBox.origin,CGPoint(0,0))
            //Swift.print("linePathOffset: " + "\(linePathOffset)")
            lineShape.frame = (strokeBoundingBox + boundingBox.origin).copy()
            lineShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y) + linePathOffset)
        }
        
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
