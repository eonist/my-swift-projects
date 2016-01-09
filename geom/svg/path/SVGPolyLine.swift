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
    /**
     * NOTE: we dont call fill because we only need to draw a stroke
     */
    override func draw()  {
        //swift.print("SVGPolyline.draw"+_points);
        drawLine(false)//Continue here: you do not close the polyline,
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
