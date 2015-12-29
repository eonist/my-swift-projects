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
        graphics.moveTo((points[0] as Point).x, (points[0] as Point).y);
        for (var i : int = 1; i < points.length; i++) graphics.lineTo((points[i] as Point).x, (points[i] as Point).y);
        graphics.lineTo((points[0] as Point).x, (points[0] as Point).y);/*closes it self to the start position*/
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
