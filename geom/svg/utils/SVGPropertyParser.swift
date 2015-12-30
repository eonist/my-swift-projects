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
}