import Foundation

class SVGPropertyParser {
	/**
	 * NOTE: could also be named attributeValue or value
	 * PARAM: key is the that matches the returned value among the attributes in the xml item
	 */
	static func property(_ xml:XML,_ key:String)->String? {
		return xml.hasAttribute(key) ? xml[key] : nil
	}
	/**
	 * Returns a Number instance or if the property is null then NaN is returned
	 */
	static func value(_ property:Any?) -> CGFloat {
		return property == nil ? CGFloat.nan : (property as! String).cgFloat//<-may be wrong conversion wrapping, also make a converter for ANy to CGFloat already
	}
	/**
	 * Returns NaN if no value is found and removes suffix "px" if found and also casts the value as a Number instance
	 * TODO: needs a re-write that doesnt include returning an associative array
	 */
	static func digit(_ xml:XML,_ key:String)->CGFloat{
        guard let prop:Any = property(xml, key) else{
            return NaN
        }
        return StringParser.digit(prop as! String)/*removes the px suffix and casts the value as a Number*/
	}
    /**
     * Returns viewBox
     */
    static func viewBox(_ xml:XML)->CGRect{
        if let prop:String = property(xml,"viewBox"){
            let values:[CGFloat] = prop.split(" ").map {$0.cgFloat}/*the map casts the array to cgFloat type*/
            return CGRect(values[0],values[1],values[2],values[3])
        }
        return CGRect(NaN,NaN,NaN,NaN)
    }
	/**
	 * Returns the id attribute if it exists in an xml item, returns an empty string if no id attribute is found
	 */
	static func id(_ xml:XML)->String {
		return xml.hasAttribute("id") ? xml["id"]! : ""
	}
	/**
	 * Returns an SVGStyle instance comprised of values derived from PARAM: xml and or PARAM: container, if no style data is available then default values are applied, NaN, empty string, null etc 
	 * NOTE: svg styles can have fill-opacity and also opacity, opacity applies to both stroke and fill
	 * SVGStyle should maybe have a master opacity value, for when you export svg again
	 */
	static func style(_ xml:XML,_ container:SVGContainable)->SVGStyle {
        guard let prop:String = property(xml,"style") else{/*if no style is present in the xml, then derive the SVGStyle from fill,stroke etc. if these values are not present, a default value will be returned NaN, empty string, null etc whatever is appropriate*/
            let fill:Any? = SVGStyleParser.fill(property(xml,"fill"), container)
            var fillOpacity:CGFloat = SVGPropertyParser.value(property(xml,"fill-opacity"))
            let fillRule:String? = property(xml,"fill-rule")
            let stroke:Any? = SVGStyleParser.stroke(property(xml,"stroke"),container)
            let strokeWidth:CGFloat = SVGPropertyParser.value(property(xml,"stroke-width"))
            var strokeOpacity:CGFloat = SVGPropertyParser.value(property(xml,"stroke-opacity"))
            let strokeLineCap:String? = property(xml,"stroke-linecap")
            let strokeLineJoin:String? = property(xml,"stroke-linejoin")
            let strokeMiterLimit:CGFloat = SVGPropertyParser.value(property(xml,"stroke-miterlimit"))
            if strokeOpacity.isNaN {strokeOpacity = SVGPropertyParser.value(property(xml,"opacity"))}/*<--new*/
            if fillOpacity.isNaN {fillOpacity = SVGPropertyParser.value(property(xml,"opacity"))}/*<--new*/
            return SVGStyle(fill, fillOpacity, fillRule, strokeWidth, stroke, strokeOpacity, strokeLineCap, strokeLineJoin, strokeMiterLimit)
        }
        return SVGStyleParser.style(prop,container)//if a style is present in the PARAM: xml, then derive the SVGStyle instance from this combined with the SVGContainer
	}
}
