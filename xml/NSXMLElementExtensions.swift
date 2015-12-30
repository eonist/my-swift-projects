import Foundation

extension NSXMLElement {
    /*
     * Convenience
     */
    subscript(key: String) -> String? {
        get {return XMLParser.attribute(self, key)}
        set {fatalError("SETTING OF ATTRIBUTES IS NOT SUPPORTED YET: " + String(newValue))}
    }
    /**
     * Convenience
     */
    func hasAttribute(attrName:String)->Bool{
        return XMLAsserter.hasAttribute(self,attrName)
    }
}
