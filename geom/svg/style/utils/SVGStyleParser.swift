import Foundation

class SVGStyleParser {
	/**
	 * // :TODO: why do we need the @param container here?
	 */
	class func style(prop:Any,_ container:ISVGContainer)->SVGStyle {
		var inlineStyle:Object = inlineStyle(prop);
//			ObjectDescriber.describe(inlineStyle);
		let fill:Any = SVGStyleParser.fill(inlineStyle["fill"], container)
		let fillOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["fill-opacity"])
		let fillRule:String = inlineStyle["fill-rule"]
		let stroke:CGFloat = SVGStyleParser.stroke(inlineStyle["stroke"])
		let strokeWidth:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-width"])
		let strokeOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-opacity"])
		let strokeLineCap:String = inlineStyle["stroke-linecap"]
		let strokeLineJoin:String = inlineStyle["stroke-linejoin"]
		let strokeMiterLimit:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-miterlimit"])
		return  SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit)
	}
	/**
	 * @param container the parent container of the svg element querried for
	 */
	class func fill(var property:Any?,container:ISVGContainer)->Any {//TODO:compact this method once its bug tested
        if(property == nil) {
            property = Double.NaN
        }
        else if(property is String && String(property) == "none") {
            property = "none"
        }
        else if(StringAsserter.color(property as! String) || StringAsserter.webColor(property as! String)) {
            property = StringParser.color(property as! String)
        }
		else{/*url(#three_stops);*/
			let url:String = String(property).match("(?<=^url\\(\\#).+?(?=\\)$)")[0];
			property = container.getItem(url);/*SVGLinearGradient*/
		}
		return property;
	}
	/**
	 * // :TODO: needs support for 3 letter hex color, you have code for this, find it
	 */
	class func stroke(property:Any?)->Double {
		return property == nil || property as! String == "none" ? Double.NaN : Double(StringParser.color(property as! String));
	}
}
