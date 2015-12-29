import Foundation

class SVGRectModifier {
	/**
	 * Scales the SVGRect instance from @param pivot to a specific @param scale scalar value (0-1)
	 * // :TODO: impliment support for scaling the rx and ry values in the SVGRect instance
	 */
	class func scale(rect:SVGRect,_ pivot:CGPoint,_ scale:CGPoint):void {
		var position:CGPoint = PointModifier.scalePoint(CGPoint(rect.x,rect.y), pivot, scale);
		var size:CGPoint = CGPoint(rect.width * scale.x, rect.height * scale.y);
		rect.x = position.x;
		rect.y = position.y;
		rect.width = size.x;
		rect.height = size.y;
	}
}
