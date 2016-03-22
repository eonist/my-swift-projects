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
        set {self.setAttributesWithDictionary([key:newValue!])}
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
    /**
     * Asserts if an NSXMLElement has complex content. Meaning something other than a stringValue. In particular another NSXMLElement
     * NOTE: To test if a child has string content: self.stringValue.count > 0
     */
    func hasComplexContent()->Bool{
        return self.childCount > 0 && self.children![0].localName != nil
    }
}
