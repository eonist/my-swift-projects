import Foundation

class SVGCircleModifier {
    /**
     * Scales the SVGCircle instance from PARAM: pivot to a specific PARAM: scale scalar value (0-1)
     */
    static func scale(_ circle:SVGCircle,_ pivot:CGPoint,_ scale:CGPoint) {
        circle.center = CGPointModifier.scale(circle.center, pivot, scale)
        circle.r = circle.r * scale.x
    }
}
