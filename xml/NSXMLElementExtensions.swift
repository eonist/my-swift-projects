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
        set {self.setAttributesWithDictionary(DictionaryModifier.combine(self.attribs,[key:newValue!]))}
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
    func valueAt(index:Array<Int>)->String?{//Convenience
        return XMLParser.valueAt(self, index)
    }
    func value()->String?{//Convenience
        return XMLParser.value(self)
    }
    func childAt(index:Array<Int>)->NSXMLElement?{//Convenience
        return XMLParser.childAt(self, index)
    }
    func childByIndex(index:Int)->NSXMLElement?{//Convenience
        return self.childAtIndex(index) as? NSXMLElement
    }
    var attribs:Dictionary<String,String> {//Convenience, the name attributes is occupied so attribs it is
       return XMLParser.attribs(self)
    }
    func addAt(child:NSXMLElement,_ index:Int)->NSXMLElement{//Convenience
        return XMLModifier.insertAt(self, index, child)
    }
    func addchildAt(child:NSXMLElement,_ index:Array<Int>)->NSXMLElement{//Convenience
        return XMLModifier.addChildAt(self, index, child)
    }
    func setNameAt(index:Array<Int>, _ name:String) -> NSXMLElement {//Convenience
        return XMLModifier.setNameAt(self, index, name)
    }
    func setAttributeAt(xml:NSXMLElement,_ index:Array<Int>, _ key:String,_ value:String) -> NSXMLElement {//Convenience
        return XMLModifier.setAttributeAt(self, index, key, value)
    }
    func setAttributeAt(xml:NSXMLElement,_ index:Array<Int>, _ attributes:Dictionary<String,String>) -> NSXMLElement {//Convenience
        return XMLModifier.setAttributeAt(xml, index, attributes)
    }
    func replaceAt(xml:NSXMLElement,_ index:Int,_ replacement:NSXMLElement) -> NSXMLElement {//Convenience
        return XMLModifier.replaceAt(xml, index, replacement)
    }
    func replaceChildAt(xml:NSXMLElement,_ index:Array<Int>,_ replacement:NSXMLElement) -> NSXMLElement {//Convenience
        return XMLModifier.replaceAt(xml, index, replacement)
    }
}