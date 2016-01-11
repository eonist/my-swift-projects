import Foundation

class SVGPolygonModifier {
    /**
     * @NOTE: if the style.fill is a Gradient then we need to scale the transform matrix to reflect the new scale of the shape
     * TODO: we need to scale the gradient.transform of the stroke aswell if it exists
     */
    class func scale(svgPolygon:SVGPolygon,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        if(svgPolygon.style != nil && svgPolygon.style!.fill is SVGGradient){
            SVGGradientModifier.scaleGradient(&(svgPolygon.style!.fill as! SVGGradient).gradientTransform,pivot,scalePoint)
        }
        svgPolygon.points = PointModifier.scalePoints(svgPolygon.points, pivot, scalePoint)
    }
}
