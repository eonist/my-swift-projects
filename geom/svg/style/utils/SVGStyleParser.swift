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
		return new SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit);;
	}
}
