import Foundation
/*
 * XML utility methods (Beta)
 * @Note: This class has methods that conver SVG elements into XML
 */
class SVGUtils {
	/**
	 * Returns svg syntax in an XML instance derived from @param svg 
	 * @param svg (isntance of a custom SVG class that is easy to work with)
	 * @Note for the reverse function look into using the adobe native functionality namespaceDeclarations, namespace to also include the namespace
	 */
	public static function xml(svg:SVG):XML {// :TODO: refactor to one or loop?
		var xml:XML = SVGUtils.svg(svg);
		for (var i : int = 0; i < svg.items.length; i++) {
			var svgGraphic:SVGGraphic = svg.items[i];
			var child:XML;
			if(svgGraphic is SVGLine) child = line(svgGraphic as SVGLine);
			else if(svgGraphic is SVGRect) child = rect(svgGraphic as SVGRect);
			else if(svgGraphic is SVGPath) child = path(svgGraphic as SVGPath);
			else if(svgGraphic is SVGGroup) child = group(svgGraphic as SVGGroup);
			xml.appendChild(child);
		}
		return xml;
	}
}