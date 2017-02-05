import Foundation
class SVGLineModifier {
	/**
	 * Scales the SVGLine element at PARAM: pivot with PARAM: scalar (0-1)
	 */
	static func scale(_ line:SVGLine, _ pivot:CGPoint, _ scale:CGPoint){
		let p1:CGPoint = PointModifier.scale(line.p1.copy(), pivot, scale)
		let p2:CGPoint = PointModifier.scale(line.p2.copy(), pivot, scale)
		line.p1 = p1
		line.p2 = p2
	}
}