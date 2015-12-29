import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by @param offset (Point)
	 * // :TODO: add support for other SVG elements as well, use switch method instead of if
	 */
	class func offsetItems(svg:SVG, _ offset:CGPoint) {
		for (var i : Int = 0; i < svg.items.count; i++) {
			let svgGraphic:SVGGraphic = svg.items[i] as! SVGGraphic;
			if(svgGraphic is SVGLine){
				(svgGraphic as! SVGLine).x1 += offset.x;
				(svgGraphic as! SVGLine).x2 += offset.x;
				(svgGraphic as! SVGLine).y1 += offset.y;
				(svgGraphic as! SVGLine).y2 += offset.y;
			}else if(svgGraphic is SVGRect){
				(svgGraphic as! SVGRect).x += offset.x;
				(svgGraphic as! SVGRect).y += offset.y;
			}
		}
	}
	/**
	 * Scales SVG elements at @param pivot to @param scale (0-1) 
	 * @param scalePoint (0 - 1)
	 * @Note this method is recursive
	 * @example SVGModifier.scale(svg, new Point(0,0), new Point(0.5,0.5));
	 */
	class func scale(element:ISVGElement,_ pivot:CGPoint, _ scale:CGPoint) {
		switch(true){
			case element is SVGPolyLine:
                (element as! SVGPolyLine).points = PointModifier.scalePoints((element as! SVGPolyLine).points, pivot, scale);/*SVGPolyLine,SVGPolygon*/break;
			case element is SVGRect:SVGRectModifier.scale(element as SVGRect, pivot, scale);break;
			case element is SVGLine:SVGLineModifier.scale(element as SVGLine,pivot,scale);break;
			case element is SVGPath:SVGPathModifier.scale(element as SVGPath, pivot, scale);break;
			case element is SVGCircle:SVGCircleModifier.scale(element as SVGCircle, pivot, scale);break;
			case element is SVGEllipse:SVGEllipseModifier.scale(element as SVGEllipse, pivot, scale);break;
			case element is SVGContainer:SVGContainerModifier.scale(element as SVGContainer,pivot,scale);break;
			case element is SVGGradient:SVGGradientModifier.scale(element as SVGGradient, pivot, scale);break;
		}
		if(element is ISVGGraphic) update(element as ISVGGraphic);
	}
	
}
