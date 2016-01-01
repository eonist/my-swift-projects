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
        Swift.print("SVGPolygon.draw()")
        let boundingBox:CGRect = PointParser.rectangle(points)
        fillShape.path = CGPathParser.lines(points,true,CGPoint(-boundingBox.x,-boundingBox.y))
        fillShape.frame = boundingBox
        Swift.print("SVGPolygon.draw() fillShape.frame: " + "\(fillShape.frame)")
        
        //continue here: get the code that can make a boundingbox from points, then set the frame of the fillShape, or else the drawLayer method wont work, write a note about this in graphic and shape class
        
        
        //TODO: implement setting of the linePath aswell
    
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}