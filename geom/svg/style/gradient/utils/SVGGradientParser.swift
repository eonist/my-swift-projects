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
	class func linearGradient(xml:NSXMLElement)->SVGLinearGradient{
		// trace("linearGradient ");
		var x1Str:String = SVGPropertyParser.property(xml,"x1")!;
		// trace("x1: " + x1);
		let x1:CGFloat = StringAsserter.percentage(x1Str) ? StringParser.percentage(x1Str) : SVGPropertyParser.value(x1Str);
		var y1Str:String = SVGPropertyParser.property(xml,"y1")!;
		let y1:CGFloat = StringAsserter.percentage(y1Str) ? StringParser.percentage(y1Str) : SVGPropertyParser.value(y1Str);
		var x2Str:String = SVGPropertyParser.property(xml,"x2")!;
		let x2:CGFloat = StringAsserter.percentage(x2Str) ? StringParser.percentage(x2Str) : SVGPropertyParser.value(x2Str);
		var y2Str:String = SVGPropertyParser.property(xml,"y2")!;
		let y2:CGFloat = StringAsserter.percentage(y2) ? StringParser.percentage(y2Str) : SVGPropertyParser.value(y2Str);
		var svgGradient:SVGGradient = Utils.gradient(xml);
		return SVGLinearGradient(svgGradient.offsets,svgGradient.colors,svgGradient.opacities,x1,y1,x2,y2,svgGradient.gradientUnits,svgGradient.spreadMethod,svgGradient.id,svgGradient.gradientTransform);
	}
}