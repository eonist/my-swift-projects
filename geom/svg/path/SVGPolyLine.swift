import Foundation
/**
 * this is basically Polygon without the fill part
 */
class SVGPolyLine : SVGPolygon{
    //var points : Array<CGPoint>;
    override init(_ points:Array<CGPoint>, _ style : SVGStyle? = nil, _ id : String? = nil) {
        //self.points = points;
        super.init(points,style, id);
    }
    
    //override func draw()  {
        //swift.print("SVGPolygon.draw"+_points);
        //graphic.lineShape = CGPathParser.lines(points)
        
        
        //continue here:
        
    //}
    override func drawFill() {
        //we override fill because we only need to draw a stroke
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
