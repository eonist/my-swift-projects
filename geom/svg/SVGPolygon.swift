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
    
    override func draw()  {
        //swift.print("SVGPolygon.draw"+_points);
        //graphic.fillShape = CGPathParser.lines(points,true)
        
        
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
