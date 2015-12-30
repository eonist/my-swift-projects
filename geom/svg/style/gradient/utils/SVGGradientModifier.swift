import Foundation

class SVGGradientModifier {
	/**
	 * Scales @param gradient at @param pivot with @param scalar (0-1)
	 * @Note works for SVGRadialGradient and SVGLinearGradient
	 */
	class func scale(gradient:SVGGradient,pivot:CGPoint,scale:CGPoint) {
        //if(gradient.gradientTransform != nil) {MatrixModifier.scale(gradient.gradientTransform, pivot, scale)}/*Scale the current applied matrix*/
        //else {gradient.gradientTransform = MatrixModifier.scale(new Matrix(), pivot, scale)}/*if there is no gradientTransform allready applied to the Gradient instnace, then apply a new Matrix instance w/ the correct scale*/
	}
}