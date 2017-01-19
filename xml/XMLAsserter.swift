import Foundation

public class XMLAsserter {
    /**
     * Asserts if PARAM: child has an attribute with the name @param attrName
     * EXAMPLE: XMLAsserter.hasAttribute(child,"type")
     */
    static func hasAttribute(_ child:XMLElement, _ attrName:String)->Bool{
        return child.attribute(forName: attrName) != nil
    }
    /**
     * Asserts if an database item has children at PARAM: index in PARAM: database
     */
    static func hasChildrenAt(_ xml:XMLElement,_ index:Array<Int>)->Bool{
        return xml.childAt(index) != nil && xml.childAt(index)!.childCount > 0
    }
    /**
     *
     */
    static func hasChildren(_ xml:XMLElement) -> Bool {
        return xml.childCount > 0
    }
    /**
     * Checks whether the specified string is valid and well formed XML.
     * PARAM: data The string that is being checked to see if it is valid XML.
     * RETURN: A Boolean value indicating whether the specified string is
     * valid XML.
     */
    static func validXML(_ xmlStr:String)->Bool{
        Swift.print("XMLAsserter.validXML UNTESTED")
        let xmlDoc:XMLDocument? = try? XMLDocument(xmlString: xmlStr, options: 0)
        if(xmlDoc == nil){return false}
        if(xmlDoc?.kind != XMLNode.Kind.element){return false;}
        return true
    }
    static func equals(_ a:XMLElement,_ b:XMLElement)->Bool {
        Swift.print("XMLAsserter.equals() UNTESTED")
        Swift.print("a.XMLString")
        Swift.print(a.xmlString)
        Swift.print("b.XMLString")
        Swift.print(b.xmlString)/**/
        return a.xmlString == b.xmlString
    }
    /**
     * Asserts if there is a text value in a node
     * EXAMPLE: "<a><one>text</one></a>".xml.firstNode("one")!.child.hasSimpleContent//true
     * NOTE: to print .kind -> use rawValue
     */
    static func hasSimpleContent(_ node:XML)->Bool{
        if(node.childCount == 1){
            return node.children![0].kind == XMLNode.Kind.text//swift 3 update.
        }
        return false
    }
    /**
     * Asserts if there is a Node value in a node
     * NOTE: an alternate way of doing this is: self.childCount > 0 && self.children![0].localName != nil
     */
    static func hasComplexContent(_ node:XML)->Bool{
        if(node.childCount > 0){
            return node.children![0].kind == XMLNode.Kind.element//swift 3 update.
        }
        return false
    }
}
//validXML
//equals
