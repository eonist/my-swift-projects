import Foundation

extension NSXMLElement {
    /**
     * convenience
     */
    convenience init(_ xmlString:String){//<---recently removed the throw, and changed try to try!
        try! self.init(XMLString:xmlString)
    }
    /*
     * convenience
     */
    subscript(key: String) -> String? {
        get {return XMLParser.attribute(self, key)}
        set {self.setAttributesWithDictionary([key:newValue!])}
    }
    func hasAttribute(attrName:String)->Bool{//Convenience
        return XMLAsserter.hasAttribute(self,attrName)
    }
    func appendChild(xml:NSXMLElement){//convenince
        self.addChild(xml)
    }
    func removeChildAt(index:Array<Int>){//Convenience
        XMLModifier.removeChildAt(self, index)
    }
    func removeAt(index:Int)->NSXMLElement{//Convenience
        return XMLModifier.removeChildAt(self, index)
    }
    /**
     * Asserts if an NSXMLElement has complex content. Meaning something other than a stringValue. In particular another NSXMLElement
     * NOTE: To test if a child has string content: self.stringValue.count > 0
     */
    func hasComplexContent()->Bool{
        return self.childCount > 0 && self.children![0].localName != nil
    }
    func addAt(child:NSXMLElement,_ index:Int)->NSXMLElement{//Convenience
        return XMLModifier.insertAt(self, index, child)
    }
    func addchildAt(child:NSXMLElement,_ index:Array<Int>)->NSXMLElement{//Convenience
        return XMLModifier.addChildAt(self, index, child)
    }
    func childAt(index:Array<Int>)->NSXMLElement?{
        return XMLParser.childAt(self, index)
    }
}