import Foundation

class SVGGradientModifier {
	/**
	 * Scales @param gradient at @param pivot with @param scalar (0-1)
	 * @Note works for SVGRadialGradient and SVGLinearGradient
	 */
	class func scale(gradient:SVGGradient,_ pivot:CGPoint,_ scale:CGPoint) {
        //fatalError("not implemented yet")
        gradient.gradientTransform?.scaleFromPoint(<#T##xScale: CGFloat##CGFloat#>, <#T##yScale: CGFloat##CGFloat#>, <#T##pivot: CGPoint##CGPoint#>)
        if(gradient.gradientTransform != nil) {MatrixModifier.scale(gradient.gradientTransform, pivot, scale)}/*Scale the current applied matrix*/
        else {gradient.gradientTransform = MatrixModifier.scale(new Matrix(), pivot, scale)}/*if there is no gradientTransform allready applied to the Gradient instnace, then apply a new Matrix instance w/ the correct scale*/
	}
}