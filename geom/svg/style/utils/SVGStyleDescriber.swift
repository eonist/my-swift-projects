import Foundation

class SVGStyleDescriber {
	/**
	 * // :TODO: doesn't this method also exist in the a parser class?
	 */
	class func describe(style:SVGStyle) {
		Swift.print("describe");
        if(style.fill is Double) {Swift.print("style.fill: " + "\(style.fill)")}
		else if(style.fill is SVGLinearGradient) {
			let linearGradient:SVGLinearGradient = style.fill as! SVGLinearGradient;
			Swift.print("linearGradient.colors: " + "\(linearGradient.colors)");
			Swift.print("linearGradient.opacities: " + "\(linearGradient.opacities)");
			Swift.print("linearGradient.offsets: " + "\(linearGradient.offsets)");
			Swift.print("linearGradient.gradientUnits: " + "\(linearGradient.gradientUnits)");
			Swift.print("linearGradient.spreadMethod: " + "\(linearGradient.spreadMethod)");
			Swift.print("linearGradient.x1: " + "\(linearGradient.x1)");
			Swift.print("linearGradient.y1: " + "\(linearGradient.y1)");
			Swift.print("linearGradient.x2: " + "\(linearGradient.x2)");
			Swift.print("linearGradient.y2: " + "\(linearGradient.y2)");
		}
		Swift.print("style.fillOpacity: " + "\(style.fillOpacity)")
		Swift.print("style.fillRule: " + "\(style.fillRule)")
		Swift.print("style.strokeWidth: " + "\(style.strokeWidth)")
		Swift.print("style.stroke: " + "\(style.stroke)")
		Swift.print("style.strokeLineCap: " + "\(style.strokeLineCap)")
		Swift.print("style.strokeLineJoin: " + "\(style.strokeLineJoin)")
		Swift.print("style.strokeMiterLimit: " + "\(style.strokeMiterLimit)")
	}
}