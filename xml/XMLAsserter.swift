import Foundation

public class XMLAsserter {
    /**
     * Asserts if @param child has an attribute with the name @param attrName
     * EXAMPLE: XMLAsserter.hasAttribute(child,"type")
     */
    public class func hasAttribute(child:NSXMLElement, _ attrName:String)->Bool{
        return child.attributeForName(attrName) != nil
    }
}

//hasChildren

//validXML

//equals