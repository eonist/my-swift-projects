import Foundation

class SVGStyleParser {
    private static var fillPattern:String = "(?<=^url\\(\\#).+?(?=\\)$)"
    private static var inlineStylePattern:String = "[^\\s]*?([\\w\\-]+?)\\s*?\\:\\s*?([\\w\\-\\#\\_\\(\\)\\.]+?)\\s*?(\\;|$)"
	/**
	 * TODO: why do we need the PARAM: container here?
	 */
	static func style(_ prop:Any,_ container:SVGContainable)->SVGStyle {
        let inlineStyle:[String:String] = SVGStyleParser.inlineStyle(String(describing: prop))
		let fill:Any? = SVGStyleParser.fill(inlineStyle["fill"], container)
		let fillOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["fill-opacity"])
		let fillRule:String? = inlineStyle["fill-rule"]
		let stroke:Any? = SVGStyleParser.stroke(inlineStyle["stroke"], container)
		let strokeWidth:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-width"])
		let strokeOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-opacity"])
		let strokeLineCap:String? = inlineStyle["stroke-linecap"]
		let strokeLineJoin:String? = inlineStyle["stroke-linejoin"]
		let strokeMiterLimit:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-miterlimit"])
		return SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit)
	}
	/**
	 * PARAM: style (fill: red; stroke:black; stroke-width: 2;)
	 */
    static func inlineStyle(_ style:String)->[String:String] {//TODO: use tuples instead?
        let matches = style.matches(inlineStylePattern)
        return matches.reduce([String:String]()) { result,match in/*Loops through the pattern*/
            var result:[String:String] = result
            let match:NSTextCheckingResult = match
            let name = match.value(style,1)/*capturing group 1*/
            let value = match.value(style,2)/*capturing group 2*/
            result[name] = value
            return result
        }
	}
	/**
	 * PARAM: container the parent container of the svg element querried for
	 */
    static func fill(_ property:Any?,_ container:SVGContainable)->Any? {/*<-this makes the value non optional can also be achived by creating a temp var*/ //TODO:compact this method once its bug tested//<-- this doesnt have to be Any! it can be Any?
        guard let property = property else{
            return nil//if property is nil return nil
        }
        if let property = property as? String, property == "none" {
            return Double.nan
        }else if StringAsserter.color(property as! String) || StringAsserter.webColor(property as! String) {
            return Double(StringParser.color(property as! String))
        }else {/*url(#three_stops);*/
			let url:String = "\(property)".match(fillPattern)[0]
			return container.getItem(url)/*SVGLinearGradient*/
		}
	}
	/**
	 * TODO: needs support for 3 letter hex color, you have code for this, find it
	 */
	static func stroke(_ property:Any?, _ container:SVGContainable)->Any? {//<-- this doesn't have to be Any! it can be Any?
        return SVGStyleParser.fill(property, container)/*we use the fill parser here as it has the same features*/
	}
    /**
     * TODO: Doesn't this method also exist in the a parser class?
     */
    static func describe(_ style:SVGStyle) {
        Swift.print("SVGParser.describe() ");
        if(style.fill is Double) {
            Swift.print("style.fill: " + "\(style.fill!)")
            Swift.print("style.fillOpacity: " + "\(style.fillOpacity!)")
        }else if(style.fill is SVGLinearGradient) {
            let linearGradient:SVGLinearGradient = style.fill as! SVGLinearGradient
            Swift.print("linearGradient.colors: " + "\(linearGradient.colors)")
            //Swift.print("linearGradient.opacities: " + "\(linearGradient.opacities)")
            Swift.print("linearGradient.offsets: " + "\(linearGradient.offsets)")
            Swift.print("linearGradient.gradientUnits: " + "\(linearGradient.gradientUnits)")
            Swift.print("linearGradient.spreadMethod: " + "\(linearGradient.spreadMethod)")
            Swift.print("linearGradient.x1: " + "\(linearGradient.x1)")
            Swift.print("linearGradient.y1: " + "\(linearGradient.y1)")
            Swift.print("linearGradient.x2: " + "\(linearGradient.x2)")
            Swift.print("linearGradient.y2: " + "\(linearGradient.y2)")
        }else{
            Swift.print("style.fill: " + "\(style.fill!)")
        }
        Swift.print("style.fillRule: " + "\(style.fillRule!)")
        Swift.print("style.strokeWidth: " + "\(style.strokeWidth!)")
        Swift.print("style.stroke: " + "\(style.stroke!)")
        Swift.print("style.strokeLineCap: " + "\(style.strokeLineCap!)")
        Swift.print("style.strokeLineJoin: " + "\(style.strokeLineJoin!)")
        Swift.print("style.strokeMiterLimit: " + "\(style.strokeMiterLimit!)")
    }
}
