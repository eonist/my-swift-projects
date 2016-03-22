import Foundation

extension NSXMLElement {
    /**
     * convenience
     */
    convenience init(_ xmlString:String) throws{
        try self.init(XMLString:xmlString)
    }
    /*
     * convenience
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
    /**
     *
     */
    func appendChild(xml:NSXMLElement){
        fatalError("not implemented yet")
    }
    
}
