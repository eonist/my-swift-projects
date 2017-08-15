import Foundation

public class XMLAsserter {
    /**
     * Asserts if PARAM: child has an attribute with the name PARAM: attrName
     * EXAMPLE: XMLAsserter.hasAttribute(child,"type")
     */
    static func hasAttribute(_ child:XML, _ attrName:String)->Bool{
        return child.attribute(forName: attrName) != nil
    }
    /**
     * Asserts if an database item has children at PARAM: index in PARAM: database
     */
    static func hasChildrenAt(_ xml:XML,_ index:[Int])->Bool{
        return xml.childAt(index) != nil && xml.childAt(index)!.childCount > 0
    }
    static func hasChildren(_ xml:XML) -> Bool {
        return xml.childCount > 0
    }
    /**
     * Checks whether the specified string is valid and well formed XML.
     * PARAM: data The string that is being checked to see if it is valid XML.
     * RETURN: A Boolean value indicating whether the specified string is
     * valid XML.
     */
    static func validXML(_ xmlStr:String)->Bool{
        guard let xmlDoc:XMLDoc = try? XMLDoc(xmlString: xmlStr, options: XMLNode.Options(rawValue: 0)) else{
            return false
        }
        if(xmlDoc.kind != XMLNode.Kind.element){return false}
        return true
    }
    static func equals(_ a:XML,_ b:XML)->Bool {
        return a.xmlString == b.xmlString
    }
    /**
     * Asserts if there is a text value in a node
     * EXAMPLE: "<a><one>text</one></a>".xml.firstNode("one")!.child.hasSimpleContent//true
     * NOTE: to print .kind -> use rawValue
     */
    static func hasSimpleContent(_ node:XML)->Bool{
        if(node.childCount == 1){
            return node.children![0].kind == XMLNode.Kind.text
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
