import Foundation

class SVGPolygonModifier {
    /**
     * @NOTE: if the style.fill is a Gradient then we need to scale the transform matrix to reflect the new scale of the shape
     * TODO: we need to scale the gradient.transform of the stroke aswell if it exists
     * TODO: the scaling of the style should be abstracted to the SVGGraphic so you can reuse the code.
     */
    class func scale(inout svgPolygon:SVGPolygon,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        Swift.print("SVGPolygonModifier.scale()")
        if(svgPolygon.style != nil && svgPolygon.style!.fill is SVGGradient){
            SVGGradientModifier.scaleGradient(&(svgPolygon.style!.fill as! SVGGradient).gradientTransform,pivot,scalePoint)
        }
        Swift.print("svgPolygon.points: " + "\(svgPolygon.points)")
        Swift.print("pivot: " + "\(pivot)")
        Swift.print("scalePoint: " + "\(scalePoint)")
        svgPolygon.points = PointModifier.scalePoints(svgPolygon.points, pivot, scalePoint)
    }
}
