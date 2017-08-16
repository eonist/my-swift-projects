import Foundation
class SVGLineModifier {
	/**
	 * Scales the SVGLine element at PARAM: pivot with PARAM: scalar (0-1)
	 */
	static func scale(_ line:SVGLine, _ pivot:CGPoint, _ scale:CGPoint){
		line.p1 = CGPointModifier.scale(line.p1.copy(), pivot, scale)
		line.p2 = CGPointModifier.scale(line.p2.copy(), pivot, scale)
	}
}
