import Foundation

typealias XML = NSXMLElement/*Makes refering to NSXMLElement simpler, just use XML instead*/
typealias XMLDoc = NSXMLDocument
extension NSXMLElement {
    /**
     * Convenience
     */
    convenience init(_ xmlString:String){//<---recently removed the throw, and changed try to try!
        try! self.init(XMLString:xmlString)
    }
    /**
     * NOTE: this method enables you to add add values to xml attributes
     * EXAMPLE: xmlChild["color"] = "blue"
     */
    subscript(key: String) -> String? {
        get {return XMLParser.attribute(self, key)}
        set {self.setAttributesWithDictionary(DictionaryModifier.combine(self.attribs,[key:newValue!]))}
    }
    func hasAttribute(attrName:String)->Bool{/*Convenience*/
        return XMLAsserter.hasAttribute(self,attrName)
    }
    func appendChild(xml:XML){/*convenince*/
        self.addChild(xml)
    }
    func removeChildAt(index:Array<Int>){/*Convenience*/
        XMLModifier.removeChildAt(self, index)
    }
    func removeAt(index:Int)->XML{/*Convenience*/
        return XMLModifier.removeChildAt(self, index)
    }
    /**
     * Asserts if an XML has complex content. Meaning something other than a stringValue. In particular another NSXMLElement
     */
    var hasComplexContent:Bool{
        return XMLAsserter.hasComplexContent(self)
    }
    var hasSimpleContent:Bool{
        return XMLAsserter.hasSimpleContent(self)
    }
    func valueAt(index:Array<Int>)->String?{/*Convenience*/
        return XMLParser.valueAt(self, index)
    }
    var value:String {return XMLParser.value(self)}/*Convenience*/
    /**
     * NOTE: xml.XMLString does the same as this var
     */
    var string:String{/*Convenience*/
        return XMLParser.string(self)
    }
    func childAt(index:Array<Int>)->XML?{/*Convenience*/
        return XMLParser.childAt(self, index)
    }
    func childByIndex(index:Int)->XML?{/*Convenience*/
        return self.childAtIndex(index) as? XML
    }
    var attribs:Dictionary<String,String> {//Convenience, the name attributes is occupied so attribs it is
       return XMLParser.attribs(self)
    }
    func addAt(child:XML,_ index:Int)->XML{/*Convenience*/
        return XMLModifier.insertAt(self, index, child)
    }
    func addchildAt(child:XML,_ index:Array<Int>)->XML{/*Convenience*/
        return XMLModifier.addChildAt(self, index, child)
    }
    func setNameAt(index:Array<Int>, _ name:String) -> XML {/*Convenience*/
        return XMLModifier.setNameAt(self, index, name)
    }
    func setAttributeAt(xml:XML,_ index:Array<Int>, _ key:String,_ value:String) -> XML {/*Convenience*/
        return XMLModifier.setAttributeAt(self, index, key, value)
    }
    func setAttributeAt(xml:XML,_ index:Array<Int>, _ attributes:Dictionary<String,String>) -> XML {/*Convenience*/
        return XMLModifier.setAttributeAt(xml, index, attributes)
    }
    func replaceAt(xml:XML,_ index:Int,_ replacement:XML) -> XML {/*Convenience*/
        return XMLModifier.replaceAt(xml, index, replacement)
    }
    func replaceChildAt(xml:XML,_ index:Array<Int>,_ replacement:XML) -> XML {/*Convenience*/
        return XMLModifier.replaceAt(xml, index, replacement)
    }
    func firstNode(nodeName:String) -> XML? {/*Convenience*/
        return XMLParser.firstNode(self, nodeName)
    }
    //deprecated:
    //func value()->String?{return XMLParser.value(self)}/*Convenience*/
}
/**
 * Multiplies a string
 * EXAMPLE: NSXMLElement("<items><items/>") += "<coffe><coffe/>" //<items><coffe><coffe/><items/>
 */
public func += (left: NSXMLElement, right: NSXMLElement) -> NSXMLElement {/*Convenience*/
    left.appendChild(right)
    return left
}