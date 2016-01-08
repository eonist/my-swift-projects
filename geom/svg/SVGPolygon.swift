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
    override func drawFill() {
        Swift.print("SVGPolygon.draw()")
        if(style!.fill != nil){
            let boundingBox:CGRect = PointParser.rectangle(points)/*We need the bounding box in order to set the frame*/
            fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))
            Swift.print("fillShape.path: " + "\(fillShape.path)")
            fillShape.frame = boundingBox
            Swift.print("SVGPolygon.draw() boundingBox: " + "\(boundingBox)")
            
        }
        
    
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}