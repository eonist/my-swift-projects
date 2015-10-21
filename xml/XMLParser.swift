import Foundation

public class XMLParser{
    /**
     * Returns the root of an xml
     */
    public class func root(xmlStr:String)->NSXMLElement?{
        let xmlDoc:NSXMLDocument = try! NSXMLDocument(XMLString: xmlStr, options: 0)
        let rootElement:NSXMLElement = xmlDoc.rootElement()!
        return rootElement
        
    }
    /**
     * Returns all children of the root
     */
    public class func rootChildren(xmlStr:String)->Array<NSXMLElement>{
        let rootElement:NSXMLElement = root(xmlStr)!
        let children:NSArray = rootElement.children!
        let theChildren:Array<NSXMLElement> = children as! [NSXMLElement]
        return theChildren
    }
    /**
     * Returns the value of a child
     * NOTE: retuns "" if there is no value
     * EXAMPLE: XMLParser.value(child)
     */
    public class func value(child:NSXMLElement)->String{
        return child.stringValue!
    }
    /**
     * Returns all attributes in @param child
     * EXAMPLE: attributes.count// num of attributes
     * EXAMPLE: if(attributes.count > 0) {  print(attributes[0]["value"]) }//prints the first attribute value in the first child that has an attribute
     */
    public class func attributes(child:NSXMLElement) -> [Dictionary<String,String>]{
        var attributes:[Dictionary<String,String>] = []
        if(child.attributes?.count > 0){
            for node:NSXMLNode in child.attributes!{
                var attribute:Dictionary<String,String> = [:]
                let name:String = node.name!
                let value:String = node.stringValue!
                //print("name: " + name + " " + "value:"+value)
                attribute["name"] = name
                attribute["value"] = value
                attributes.append(attribute)
            }
        }
        return attributes
    }
    /**
    * Returns child from @param children at @param index
    * EXAMPLE: XMLParser.childAt(children, 0)
    */
    public class func childAt(children:NSArray, _ index:Int)->NSXMLElement?{
        return children[index] as? NSXMLElement
    }
    /**
    * Returns the attribute value of @param child by key @param name
    * @pram name: name of the attribute
    * EXAMPLE: if let type:String = XMLParser.attribute(child, "type") { print("type: " + type) }
    * EXAMPLE: print(XMLParser.attribute(child, "type"))//returns Optional("digital") if there is something
    * NOTE: returns nil if there is no attr by that name
    */
    public class func attribute(child:NSXMLElement,_ name:String)->String?{
        return child.attributeForName(name)?.stringValue
    }
    /**
    * Returns the name of the @param child
    */
    public class func name(child:NSXMLElement)->String{
        return child.name!//child.localName also works
    }
    /**
    * Returns the first attribute that contains the attribute by the @param name and with the @param value
    */
    public class func childByAttribute(child:NSXMLElement,_ attributeName:String,_ attributeValue:String){
        //not implimented yet
    }
    /**
    * You can also drill down to the nodes you want using [ xmldoc nodesForXPath: @"/application/movie[@name='tc']" error: err ]
    * You can use the returned nodes as the new context node for evaluating further XPath expressions.
    */
    class func xPath(){
        
    }
}