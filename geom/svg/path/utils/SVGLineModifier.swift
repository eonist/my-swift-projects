import Foundation
class SVGLineModifier {
	/**
	 * Scales the SVGLine element at @param pivot with @param scalar (0-1)
	 */
	class func scale(line:SVGLine, _ pivot:CGPoint, _ scale:CGPoint){
		let p1:CGPoint = PointModifier.scale(line.p1.copy(), pivot, scale);
		let p2:CGPoint = PointModifier.scale(line.p2.copy(), pivot, scale);
		line.p1 = p1
		line.p2 = p2
	}
}