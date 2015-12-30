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
		let y2:CGFloat = StringAsserter.percentage(y2Str) ? StringParser.percentage(y2Str) : SVGPropertyParser.value(y2Str);
		var svgGradient:SVGGradient = Utils.gradient(xml);
		return SVGLinearGradient(svgGradient.offsets,svgGradient.colors,svgGradient.opacities,x1,y1,x2,y2,svgGradient.gradientUnits,svgGradient.spreadMethod,svgGradient.id,svgGradient.gradientTransform);
	}
}
private class Utils{
	/**
	 * Returns an gradient instance with data derived from @param xml 
	 */
	class func gradient(xml:NSXMLElement)->SVGGradient{
		var offsets:Array<CGFloat> = [];
		var colors:Array<Double> = [];
		var opacities:Array<CGFloat> = [];
        let children:NSArray = xml.children!
        for (var i = 0; i < xml.childCount; i++) {
            let child:NSXMLElement = XMLParser.childAt(children, i)!
            
			var offsetStr:String = SVGPropertyParser.property(child,"offset")!
            var offset:CGFloat = StringAsserter.digit(offsetStr) ? CGFloat(Double(offsetStr)!) * 255 : StringParser.percentage(offsetStr) / 100 * 255;
			/*offset is number between 0-1 or offset is percentage %*/
			// :TODO: possibly itterate the offset if its null (see Element framework on how to do this)
			// trace("offset: " + offset);
			var stopColor:Number;
			var stopOpacity:Number;
			/*0-1*/
			var style:String = SVGPropertyParser.property(child,"style");
			// :TODO: if style is present then dont check for color etc
			if(style != null){
				// trace("style: " + style);
				var inlineStyle:Object = SVGStyleParser.inlineStyle(style);
//				ObjectParser.describe(inlineStyle);
				var stopColorProperty:* = inlineStyle["stop-color"];
				// trace("stopColorProperty: " + stopColorProperty);
				stopColor = StringParser.color(stopColorProperty);
				stopOpacity = SVGPropertyParser.value(inlineStyle["stop-opacity"]);
				// trace("stopOpacity: " + stopOpacity);
			} else{
				stopColor = StringParser.color(SVGPropertyParser.property(child,"stop-color"));
				stopOpacity = SVGPropertyParser.value(SVGPropertyParser.property(child,"stop-opacity"));
			}
			if(isNaN(stopOpacity)) stopOpacity = 1;/*Forces stopOpacity to be 1 if its NaN*/
			offsets.push(offset);
			colors.push(stopColor);
			opacities.push(stopOpacity);
		}
		// trace("colors: " + colors);
		// trace("offsets: " + offsets);
		// trace("opacities: " + opacities);
		var gradientUnits:String = SVGPropertyParser.property(xml,"gradientUnits");
		/*userSpaceOnUse*/
		// trace("gradientUnits: " + gradientUnits);
		var spreadMethod:String = SVGPropertyParser.property(xml,"spreadMethod");
		var id:String = SVGPropertyParser.id(xml);
		var gradientTransform:Matrix = Utils.gradientTransform(xml);
		return new SVGGradient(offsets,colors,opacities,spreadMethod,id,gradientUnits,gradientTransform);
	}
}