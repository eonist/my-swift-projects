import Foundation

class SVGPolygonModifier {
    /**
     * @NOTE: we need to scale the 
     */
    class func scale(svgPolygon:SVGPolygon,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        if(svgPolygon.style != nil && svgPolygon.style!.fill is SVGGradient){
            SVGGradientModifier.scaleGradient(&(svgPolygon.style!.fill as! SVGGradient).gradientTransform,pivot,scalePoint)
        }
        svgPolygon.points = PointModifier.scalePoints(svgPolygon.points, pivot, scalePoint)
    }
}
