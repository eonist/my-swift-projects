import Foundation

class SVGCircleModifier {
    /**
     * Scales the SVGCircle instance from PARAM: pivot to a specific PARAM: scale scalar value (0-1)
     */
    static func scale(_ circle:SVGCircle,_ pivot:CGPoint,_ scale:CGPoint) {
        let circleCenter:CGPoint = PointModifier.scale(circle.center, pivot, scale)
        let circleRadius:CGFloat = circle.r * scale.x
        circle.center = circleCenter
        circle.r = circleRadius
    }
}