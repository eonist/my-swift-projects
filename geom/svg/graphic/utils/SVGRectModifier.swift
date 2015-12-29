import Foundation

class SVGRectModifier {
	/**
	 * Scales the SVGRect instance from @param pivot to a specific @param scale scalar value (0-1)
	 * // :TODO: impliment support for scaling the rx and ry values in the SVGRect instance, you have code for this Think fillet classes
	 */
	class func scale(rect:SVGRect,_ pivot:CGPoint,_ scale:CGPoint) {
		let position:CGPoint = PointModifier.scale(rect.position, pivot, scale);
		let size:CGSize = CGSize(rect.width * scale.x, rect.height * scale.y);//TODO:use CGRect scale method instead
		rect.x = position.x;
		rect.y = position.y;
		rect.width = size.width;
		rect.height = size.height;
	}
}
