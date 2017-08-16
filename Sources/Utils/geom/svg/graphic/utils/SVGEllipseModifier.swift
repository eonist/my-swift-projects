import Foundation

class SVGEllipseModifier {
    /**
     * Scales the SVGEllipse instance from PARAM: pivot to a specific PARAM: scale scalar value (0-1)
     */
    static func scale(_ ellipse:SVGEllipse,_ pivot:CGPoint,_ scale:CGPoint) {
        ellipse.center = CGPointModifier.scale(ellipse.center, pivot, scale)
        ellipse.radius = CGPointModifier.scale(ellipse.radius, pivot, scale)
    }
}
