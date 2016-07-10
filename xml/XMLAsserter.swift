import Foundation

public class XMLAsserter {
    /**
     * Asserts if @param child has an attribute with the name @param attrName
     * EXAMPLE: XMLAsserter.hasAttribute(child,"type")
     */
    public class func hasAttribute(child:NSXMLElement, _ attrName:String)->Bool{
        return child.attributeForName(attrName) != nil
    }
    /**
     * Asserts if an database item has children at @param index in @param database
     */
    class func hasChildrenAt(xml:NSXMLElement,_ index:Array<Int>)->Bool{
        return xml.childAt(index)?.childCount > 0
    }
    /**
     *
     */
    class func hasChildren(xml:NSXMLElement) -> Bool {
        return xml.childCount > 0
    }
    /**
     * Checks whether the specified string is valid and well formed XML.
     * @param data The string that is being checked to see if it is valid XML.
     * @return A Boolean value indicating whether the specified string is
     * valid XML.
     */
    class func validXML(xmlStr:String)->Bool{
        Swift.print("UNTESTED")
        let xmlDoc:NSXMLDocument? = try? NSXMLDocument(XMLString: xmlStr, options: 0)
        if(xmlDoc == nil){return false}
        if(xmlDoc?.kind != NSXMLNodeKind.ElementKind){return false;}
        return true
    }
    class func equals(a:NSXMLElement,_ b:NSXMLElement)->Bool {
        Swift.print("UNTESTED")
        return a.XMLString == b.XMLString
    }
}
//validXML
//equals