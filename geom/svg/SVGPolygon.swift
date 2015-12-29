import Foundation
/**
 * Draws a polygon based on points, closes it self to the first point
 */
class SVGPolygon:SVGGraphic,ISVGPolyLine{
    var points : Array<CGPoint>;
    init(_ points:Array, _ style : SVGStyle? = nil, _ id : String? = nil) {
        _points = points;
        super.init(style, id);
    }

    
        
    
    override func draw()  {
        //swift.print("SVGPolygon.draw"+_points);
        let path = CGPathParser.polyLinePath(<#T##points: Array<CGPoint>##Array<CGPoint>#>)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
