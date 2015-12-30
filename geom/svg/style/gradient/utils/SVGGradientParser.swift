import Foundation
/**
 * This class has methods that converts xml data into SVGGradient instances
 */
class SVGGradientParser {
	/**
	 * Returns an gradient instance with data derived from @param xml 
	 * @param xml (<linearGradient id="skyline"><stop offset="0" style="stop-color:blue"/><stop offset="1" style="stop-color:red"/></linearGradient>)
	 * other attributes: gradientTransform,gradientUnits,xlink:href
	 */
	class func linearGradient(xml:XML)->SVGLinearGradient{
		// trace("linearGradient ");
		var x1:* = SVGPropertyParser.property(xml,"x1");
		// trace("x1: " + x1);
		x1 = StringAsserter.percentage(x1) ? StringParser.percentage(x1) : SVGPropertyParser.value(x1);
		var y1:* = SVGPropertyParser.property(xml,"y1");
		y1 = StringAsserter.percentage(y1) ? StringParser.percentage(y1) : SVGPropertyParser.value(y1);
		var x2:* = SVGPropertyParser.property(xml,"x2");
		x2 = StringAsserter.percentage(x2) ? StringParser.percentage(x2) : SVGPropertyParser.value(x2);
		var y2:* = SVGPropertyParser.property(xml,"y2");
		y2 = StringAsserter.percentage(y2) ? StringParser.percentage(y2) : SVGPropertyParser.value(y2);
		var svgGradient:SVGGradient = Utils.gradient(xml);
		return new SVGLinearGradient(svgGradient.offsets,svgGradient.colors,svgGradient.opacities,x1,y1,x2,y2,svgGradient.gradientUnits,svgGradient.spreadMethod,svgGradient.id,svgGradient.gradientTransform);
	}
}