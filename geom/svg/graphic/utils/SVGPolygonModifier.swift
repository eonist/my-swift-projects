import Foundation

class SVGPolygonModifier {
    /**
     *
     */
    class func scale(svgPolygon:SVGPolygon,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        if(svgPolygon.style != nil && svgPolygon.style!.fill is SVGGradient){
            (svgPolygon.style!.fill as! SVGGradient).gradientTransform
        }
        svgPolygon.points = PointModifier.scalePoints(svgPolygon.points, pivot, scalePoint)
    }
}
