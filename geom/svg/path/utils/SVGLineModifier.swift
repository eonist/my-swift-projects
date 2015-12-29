import Foundation
class SVGLineModifier {
	/**
	 * Scales the SVGLine element at @param pivot with @param scalar (0-1)
	 */
	class func scale(line:SVGLine, _ pivot:CGPoint, _ scale:CGPoint){
		var p1:CGPoint = PointModifier.scalePoint(CGPoint(line.x1,line.y1), pivot, scale);
		var p2:CGPoint = PointModifier.scalePoint(CGPoint(line.x2,line.y2), pivot, scale);
		line.x1 = p1.x;
		line.y1 = p1.y;
		line.x2 = p2.x;
		line.y2 = p2.y;
	}
}
