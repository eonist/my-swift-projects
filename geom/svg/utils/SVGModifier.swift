import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by @param offset (Point)
	 * // :TODO: add support for other SVG elements as well, use switch method instead of if
	 */
	class func offsetItems(svg:SVG, offset:CGPoint) {
		for (var i : Int = 0; i < svg.items.count; i++) {
			var svgGraphic:SVGGraphic = svg.items[i];
			if(svgGraphic is SVGLine){
				(svgGraphic as SVGLine).x1 += offset.x;
				(svgGraphic as SVGLine).x2 += offset.x;
				(svgGraphic as SVGLine).y1 += offset.y;
				(svgGraphic as SVGLine).y2 += offset.y;
			}else if(svgGraphic is SVGRect){
				(svgGraphic as SVGRect).x += offset.x;
				(svgGraphic as SVGRect).y += offset.y;
			}
		}
	}
}
