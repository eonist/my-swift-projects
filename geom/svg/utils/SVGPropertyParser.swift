import Foundation

class SVGPropertyParser {
	/**
	 * @Note could also be named attributeValue or value
	 * @param key is the that matches the returned value among the attributes in the xml item
	 */
	class func property(xml:NSXMLElement,key:String):* {
		return xml.hasOwnProperty("@"+key) ? xml["@"+key] : null;
	}
}