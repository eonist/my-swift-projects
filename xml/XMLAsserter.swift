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
}



//validXML

//equals