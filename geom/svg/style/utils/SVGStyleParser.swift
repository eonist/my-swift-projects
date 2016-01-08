import Foundation

class SVGStyleParser {
	/**
	 * // :TODO: why do we need the @param container here?
	 */
	class func style(prop:Any,_ container:ISVGContainer)->SVGStyle {
		var inlineStyle:Dictionary<String, String> = SVGStyleParser.inlineStyle(prop as! String);
		//ObjectDescriber.describe(inlineStyle);
		let fill:Any = SVGStyleParser.fill(inlineStyle["fill"], container)
		let fillOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["fill-opacity"])
		let fillRule:String = inlineStyle["fill-rule"]!
		let stroke:Double = SVGStyleParser.stroke(inlineStyle["stroke"])
		let strokeWidth:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-width"])
		let strokeOpacity:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-opacity"])
		let strokeLineCap:String = inlineStyle["stroke-linecap"]!
		let strokeLineJoin:String = inlineStyle["stroke-linejoin"]!
		let strokeMiterLimit:CGFloat = SVGPropertyParser.value(inlineStyle["stroke-miterlimit"])
		return  SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit)
	}
	/**
	 * @param style (fill: red; stroke:black; stroke-width: 2;)
	 */
	class func inlineStyle(style:String)->Dictionary<String, String> {
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
            inlineStyles[name] = value;
        }
		return inlineStyles;
	}
	/**
	 * @param container the parent container of the svg element querried for
	 */
	class func fill(var property:Any?,_ container:ISVGContainer)->Any!/*<-this makes the value non optional can also be achived by creating a temp var*/ {//TODO:compact this method once its bug tested
        Swift.print("SVGStyleParser.fill() property: " + "\(property)")
        if(property == nil) {
            property = Double.NaN
        }
        else if(property is String && String(property) == "none") {
            property = "none"
        }
        else if(StringAsserter.color(property as! String) || StringAsserter.webColor(property as! String)) {
            property = /*Double*/(StringParser.color(property as! String))
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
