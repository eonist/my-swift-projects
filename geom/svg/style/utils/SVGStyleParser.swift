import Foundation

class SVGStyleParser {
	/**
	 * // :TODO: why do we need the @param container here?
	 */
	class func style(prop:Any,_ container:ISVGContainer)->SVGStyle {
		var inlineStyle:Dictionary<String, String> = SVGStyleParser.inlineStyle(String(prop));
		//ObjectDescriber.describe(inlineStyle);
		let fill:Any = SVGStyleParser.fill(inlineStyle["fill"], container)
		let fillOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["fill-opacity"])
		let fillRule:String? = inlineStyle["fill-rule"]
		let stroke:Any = SVGStyleParser.stroke(inlineStyle["stroke"], container)
		let strokeWidth:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-width"])
		let strokeOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-opacity"])
		let strokeLineCap:String? = inlineStyle["stroke-linecap"]
		let strokeLineJoin:String? = inlineStyle["stroke-linejoin"]
		let strokeMiterLimit:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-miterlimit"])
		return  SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit)
	}
	/**
	 * @param style (fill: red; stroke:black; stroke-width: 2;)
	 */
	class func inlineStyle(style:String)->Dictionary<String, String> {//TODO: use tuples instead?
		//Swift.print("inlineStyle: "+style);
        var inlineStyles:Dictionary<String, String> = Dictionary<String, String>()
		let pattern:String = "[^\\s]*?([\\w\\-]+?)\\s*?\\:\\s*?([\\w\\-\\#\\_\\(\\)\\.]+?)\\s*?(\\;|$)"
        let matches = style.matches(pattern)
        for match:NSTextCheckingResult in matches {//Loops through the pattern
            match.numberOfRanges
            //let content = (style as NSString).substringWithRange(match.rangeAtIndex(0))//the entire match
            let name = (style as NSString).substringWithRange(match.rangeAtIndex(1))//capturing group 1
            //Swift.print("name: >" + name+"<");
            let value = (style as NSString).substringWithRange(match.rangeAtIndex(2))//capturing group 2
            //Swift.print("value: >" + value+"<");
            inlineStyles[name] = value
        }
		return inlineStyles
	}
	/**
	 * @param container the parent container of the svg element querried for
	 */
	class func fill(var property:Any?,_ container:ISVGContainer)->Any?/*<-this makes the value non optional can also be achived by creating a temp var*/ {//TODO:compact this method once its bug tested//<-- this doesnt have to be Any! it can be Any?
        //Swift.print("SVGStyleParser.fill() property: " + "\(property)")
        if(property == nil) {
            property = nil
        }else if(property! is String && (property as! String) == "none") {
            property = Double.NaN
        }else if(StringAsserter.color(property as! String) || StringAsserter.webColor(property as! String)) {
            property = Double(StringParser.color(property as! String))
        }else{/*url(#three_stops);*/
			let url:String = String(property!).match("(?<=^url\\(\\#).+?(?=\\)$)")[0]
            //Swift.print("url: " + "\(url)")
			property = container.getItem(url)/*SVGLinearGradient*/
            //Swift.print("property: " + "\(property)")
		}
		return property
	}
	/**
	 * // :TODO: needs support for 3 letter hex color, you have code for this, find it
	 */
	class func stroke(property:Any?, _ container:ISVGContainer)->Any? {//<-- this doesnt have to be Any! it can be Any?
        return SVGStyleParser.fill(property, container)/*we use the fill parser here as it has the same features*/
	}
    /**
     * // :TODO: doesn't this method also exist in the a parser class?
     */
    class func describe(style:SVGStyle) {
        Swift.print("SVGParser.describe() ");
        if(style.fill is Double) {
            Swift.print("style.fill: " + "\(style.fill)")
            Swift.print("style.fillOpacity: " + "\(style.fillOpacity)")
        }else if(style.fill is SVGLinearGradient) {
            let linearGradient:SVGLinearGradient = style.fill as! SVGLinearGradient;
            Swift.print("linearGradient.colors: " + "\(linearGradient.colors)");
            //Swift.print("linearGradient.opacities: " + "\(linearGradient.opacities)");
            Swift.print("linearGradient.offsets: " + "\(linearGradient.offsets)");
            Swift.print("linearGradient.gradientUnits: " + "\(linearGradient.gradientUnits)");
            Swift.print("linearGradient.spreadMethod: " + "\(linearGradient.spreadMethod)");
            Swift.print("linearGradient.x1: " + "\(linearGradient.x1)");
            Swift.print("linearGradient.y1: " + "\(linearGradient.y1)");
            Swift.print("linearGradient.x2: " + "\(linearGradient.x2)");
            Swift.print("linearGradient.y2: " + "\(linearGradient.y2)");
        }else{
            Swift.print("style.fill: " + "\(style.fill)")
        }
        Swift.print("style.fillRule: " + "\(style.fillRule)")
        Swift.print("style.strokeWidth: " + "\(style.strokeWidth)")
        Swift.print("style.stroke: " + "\(style.stroke)")
        Swift.print("style.strokeLineCap: " + "\(style.strokeLineCap)")
        Swift.print("style.strokeLineJoin: " + "\(style.strokeLineJoin)")
        Swift.print("style.strokeMiterLimit: " + "\(style.strokeMiterLimit)")
    }
}