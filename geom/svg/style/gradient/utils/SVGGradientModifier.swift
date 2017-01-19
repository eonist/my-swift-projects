import Foundation

class SVGGradientModifier {
	/**
	 * Scales PARAM: gradient at PARAM: pivot with PARAM: scalar (0-1)
	 * NOTE: works for SVGRadialGradient and SVGLinearGradient
	 */
	static func scale(_ gradient:SVGGradient,_ pivot:CGPoint,_ scale:CGPoint) {
        //Swift.print("SVGGradientModifier.scale()" + "\(gradient.gradientTransform)")
        //fatalError("not implemented yet")
        scaleGradient(&gradient.gradientTransform,pivot,scale)
        //Swift.print("gradient.gradientTransform: " + "\(gradient.gradientTransform)")
    }
    /**
     *
     */
    static func scaleGradient(_ gradientTransform:inout CGAffineTransform?,_ pivot:CGPoint,_ scale:CGPoint){
        //Swift.print("SVGGradientModifier.scaleGradient")
        if(gradientTransform != nil) {
            var transform:CGAffineTransform = CGAffineTransform.identity
            transform.scaleFromPoint(scale.x, scale.y, pivot)
            gradientTransform = gradientTransform!.concatenating(transform)//swift 3 update
            
        }/*Scale the current applied matrix*/
        else {
            gradientTransform = CGAffineTransform.scaleFromPoint(CGAffineTransform.identity, scale.x, scale.y, pivot)
        }/*if there is no gradientTransform allready applied to the Gradient instnace, then apply a new Matrix instance w/ the correct scale*/
    }
}
