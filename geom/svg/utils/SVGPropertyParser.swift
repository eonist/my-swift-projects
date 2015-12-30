import Foundation

class SVGPropertyParser {
	/**
	 * @Note could also be named attributeValue or value
	 * @param key is the that matches the returned value among the attributes in the xml item
	 */
	class func property(xml:NSXMLElement,_ key:String)->String? {
		return xml.hasAttribute("@"+key) ? xml["@"+key] : nil;
	}
	/**
	 * Returns a Number instance or if the property is null then NaN is returned
	 */
	class func value(property:Any?) -> CGFloat {
		return property == nil ? CGFloat.NaN : CGFloat(Double(String(property))!)//<-may be wrong conversion wrapping, also make a converter for ANy to CGFloat already
	}
	/**
	 * Returns NaN if no value is found and removes suffix "px" if found and also casts the value as a Number instance
	 * // :TODO: needs a re-write that doesnt include returning an associative array
	 */
	class func digit(xml:XML,key:String):CGFloat{
		var prop:* = property(xml, key);
		if(prop == nil) return NaN;
		return StringParser.digit(prop);//removes the px suffix and casts the value as a Number
	}
}