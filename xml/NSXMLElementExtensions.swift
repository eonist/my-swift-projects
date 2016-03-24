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
    func appendChild(xml:NSXMLElement){//convenince
        self.addChild(xml)
    }
    func removeChildAt(index:Array<Int>){
        XMLModifier.removeChildAt(self, index)
    }
    func removeAt(index:Int)->NSXMLElement{
        return XMLModifier.removeChildAt(self, index)
    }
    /**
     * Asserts if an NSXMLElement has complex content. Meaning something other than a stringValue. In particular another NSXMLElement
     * NOTE: To test if a child has string content: self.stringValue.count > 0
     */
    func hasComplexContent()->Bool{
        return self.childCount > 0 && self.children![0].localName != nil
    }
    func addChildAt(child:NSXMLElement,_ index:Int)->NSXMLElement{
        return XMLModifier.insertAt(self, index, child)
    }
    func addAt(child:NSXMLElement,_ index:Array<Int>)->NSXMLElement{
        return XMLModifier.addChildAt(self, index, child)
    }
}
