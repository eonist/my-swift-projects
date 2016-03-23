import Foundation

public class XMLParser{
    /**
     * Returns the root of an xml
     * EXAMPLE: let xml:NSXMLElement = XMLParser.root("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")!
     * EXAMPLE: Swift.print(xml.children![0].childCount)//2
     * EXAMPLE: <media><book><novel/><biography/></book><music><cd/><cassette/></music><film><dvd/><vhs/><blueray/><dvd>movie.mkv</dvd></film><media>
     * NOTE: https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/NSXML_Concepts/NSXML.html#//apple_ref/doc/uid/TP40001263-SW1
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
    *
    */
    public class func rootChildrenByFilePath(filePath:String)->Array<NSXMLElement>{
        let xmlStr:String = FileParser.content(filePath)!
        return rootChildren(xmlStr)
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
     * Returns an an XML instance at @param index (Array index)
     * @Note this function is recursive
     * @Note to find a child at an integer use the native code: xml.children[integer]
     * @Note to find the children of the root use an empty array as the index value
     */
    class func childAt(xml:NSXMLElement?,_ index:Array<Int>)->NSXMLElement? {
        if(index.count == 0 && xml != nil) {return xml}
        else if(index.count == 1 && xml != nil && XMLParser.childAt(xml!.children!, index[0]) != nil) {XMLParser.childAt(xml!.children!, index[0])}// :TODO: if index.length is 1 you can just ref index
        else if(index.count > 1 && xml!.children!.count > 0) {return XMLParser.childAt(xml!.children![index[0]] as? NSXMLElement,index.slice(1,index.count))}
        return nil
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
    /**
     * Parses through an xml and returns an array
     * @example
     * 	<items>
            <item title="orange" property="harry"/>
            <item title="blue" property="na"/>
        </items>
     * outputs: [{title:"orange", property:harry}, {title:"blue", property:"no"}]
     * TODO: Does it support xml string value? 
     */
    class func toArray(xml:NSXMLElement)->[Dictionary<String,String>] {
        var items:[Dictionary<String,String>] = []
        let count = xml.children!.count//or use rootElement.childCount TODO: test this
        for (var i = 0; i < count; i++) {
            let child:NSXMLElement = XMLParser.childAt(xml.children!, i)!
            //print("Import - child.toXMLString(): " + child.toXMLString());
            var item:Dictionary<String,String> = Dictionary<String,String>()
            let attributes:[Dictionary<String,String>] = XMLParser.attributes(child)
            for attribute in attributes {
                item[attribute["name"]!] = attribute["value"]!
            }
            if(child.stringValue != nil && child.stringValue!.count > 0) { item["xml"] = child.stringValue! }// :TODO: this may need to be rolled back to previouse code state
            items.append(item);
        }
        return items;
    }
    /**
     *
     */
    class func toDictionary(xml:NSXMLElement)->[String:AnyObject]{
        var root = [String:AnyObject]()
        
        let attributes = XMLParser.attributes(xml)
        for attr in attributes{
            root[attr["key"]!] = attr["value"]!
        }
        
        
        //assert if children.count == 0
        //then add array with stringValue instead
        
        //Swift.print("xml.name!: " + "\(xml.name!)")
        if(xml.stringValue != nil && xml.stringValue != ""){
            Swift.print("has string value")
            Swift.print("xml.stringValue: " + "\(xml.stringValue)")
            root[xml.name!] = [xml.stringValue] as? AnyObject//could possibly also use generics here
        }else if(xml.childCount > 0){
            Swift.print("has children")
            //Swift.print("xml.childCount: " + "\(xml.childCount)")
            var children:Array<[String:AnyObject]> = [[String:AnyObject]()]
            for child in xml.children!{
                children.append(toDictionary(child as! NSXMLElement))
            }
            root[xml.name!] = children
        }else{
            Swift.print("no value")
            //Swift.print("empty array")
            root[xml.name!] = []
        }
        return root
    }
    /**
     * Converts a multi dimensional Dictionary to an XML
     * NOTE: supports: attributes,string content, node name, sub nodes etc
     * TODO: Figure out a more elegant way to grab the node name. Preferably by delaying setting the node name until right before the xml is returned
     * EXAMPLE: toXML(["name":[]])//Output:<name></name>
     * EXAMPLE: toXML(["name":["title":["some content"],"age":"16"],"color":"blue"])//Output: <name color="blue"><title age="16">some content here</title></name>
     * EXAMPLE: toXML(["name":[["color":["blue"]],["title":["Worker"]]]])//<name><color>blue</color><title>Worker</title></name>
     * EXAMPLE:
     * var titleDict:Dictionary<String,AnyObject> = [String:AnyObject]()
     * titleDict["title"] = ["some content here"]
     * titleDict["age"] = "16"
     * var nameDict:Dictionary<String,AnyObject> = [String:AnyObject]()
     * nameDict["name"] = titleDict
     * nameDict["color"] = "blue"
     * toXML(nameDict)//Output: <name color="blue"><title age="16">some content here</title></name>
     */
    class func toXML(content:AnyObject)->NSXMLElement{
        let xml:NSXMLElement = NSXMLElement()
        func handleArray2(theXML:NSXMLElement,_ theContent:AnyObject){
            for item in (theContent as! Array<AnyObject>){
                if(item is String){theXML.stringValue = item as? String}
                else if(item is Dictionary<String, AnyObject>){theXML.appendChild(toXML(item))}//handle dictionary here
                else{fatalError("this cant happen")}//array
            }
        }
        if(content is Dictionary<String, AnyObject>){//content is a dictionary
            let dict = content as! Dictionary<String, AnyObject>
            for (theKey,theValue) in dict{
                if(theValue is String) {xml[theKey] = theValue as? String}//attributes
                else if(theValue is Dictionary<String, AnyObject>){xml.name = theKey;xml.appendChild(toXML(theValue))}//dictionary
                else {xml.name = theKey;handleArray2(xml,theValue)}//array
            }
        }
        return xml
    }
    
}