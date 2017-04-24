import Foundation

public class XMLParser{
    /**
     * Convert xml to multidimensional array
     * IMPORTANT: node name is not preserved.
     * TODO: You could create a more JSON like conversion system. as JSON stores node-name as well.
     * OUTPUT: [[key:value,key:value],[[key:value],"string"]]
     */
    static func arr(_ xml:XML) -> [Any]{
        //var items:[Any] = []
        //let count = xml.children!.count//or use rootElement.childCount TODO: test this
        if let children = xml.children {
            return children.lazy.filter(){
                return ($0 as? XML) != nil//we could do filter.map if it could be combinable with lazy?
                }.map{
                    let child:XML = $0 as! XML//at this point your garantueed that the child is XML
                    var item:[Any] = []
                    let attribs = child.attribs
                    if(!attribs.isEmpty){
                        item.append(attribs)
                    }
                    if(child.stringValue != nil && child.stringValue!.count > 0) {
                        item.append(child.stringValue!)
                    }else if(child.hasComplexContent) {
                        item.append(arr(child))
                    }
                    return item
            }
        }
        return []
    }
    /**
     * Returns the first matching xml that has the attribute key value pair PARAM attribute in PARAM: xml
     * NOTE: recursive
     */
    static func index(_ xml:XML,_ key:String, _ value:String) -> [Int]? {
        if(xml[key] == value) {
            return []
        }else if(xml.childCount > 0){
            for i in 0..<xml.childCount{
                let child:XML = xml.children![i] as! XML
                let match:[Int]? = index(child,key,value)
                if(match != nil) {return [i] + match!}
            }
        }
        return nil
    }
    /**
     * Converts XML to Dictioinary and Array notation
     * NOTE: the format can then be converted back to xml and vis verca
     * EXAMPLE: toDictionary(try! XML("<name><color>blue</color><title>Worker</title></name>"))//Output: ["name":[["color":["blue"]],["title":["Worker"]]]]
     */
    
    //Swift 3 update: This method was changed from using AnyObject to Any
    
    static func toDictionary(_ xml:XML)->[String:Any]{
        var root = [String:Any]()
        let attributes = XMLParser.attributes(xml)//<--use attribs instead
        attributes.forEach{ root[$0["key"]!] = $0["value"]!}
        if(xml.hasComplexContent){
            let children:[[String:Any]] = xml.children?.map{toDictionary($0 as! XML)} ?? []
            root[xml.name!] = children
        }else if(xml.stringValue != nil && xml.stringValue != ""){root[xml.name!] = [xml.stringValue!]}
        else{root[xml.name!] = []}
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
     * TODO: ⚠️️ Probably use Any instead of AnyObject
     */
    static func toXML(_ content:AnyObject)->XML{
        let xml:XML = XML()
        func handleArray(_ theXML:XML,_ theContent:AnyObject){
            for item in (theContent as! [AnyObject]){//<- this looks not so good
                if(item is String){
                    theXML.stringValue = item as? String
                }else if(item is [String:AnyObject]){/*handle dictionary here*/
                    theXML.appendChild(toXML(item))/*<--recursive*/
                }else{/*array*/
                    fatalError("this can't happen")
                }
            }
        }
        if let dict = content as? [String:AnyObject]{/*content is a dictionary*/
            dict.forEach { key,value in
                if(value is String) {/*attributes*/
                    xml[key] = value as? String
                }
                else if(value is Dictionary<String, AnyObject>){/*dictionary*/
                    xml.name = key
                    xml.appendChild(toXML(value))/*<--recursive*/
                }else {
                    xml.name = key;
                    handleArray(xml,value)
                }/*array*/
            }
        }
        return xml
    }
    /**
     * Returns the first attribute that contains the attribute by the PARAM: name and with the PARAM: value
     */
    static func childByAttribute(_ child:XML,_ attributeName:String,_ attributeValue:String){
        //not implimented yet
    }
    /**
     * You can also drill down to the nodes you want using [ xmldoc nodesForXPath: @"/application/movie[@name='tc']" error: err ]
     * You can use the returned nodes as the new context node for evaluating further XPath expressions.
     */
    static func xPath(){
    }
}
extension XMLParser{
    /**
     * Parses through an xml and returns an array
     * NOTE: this method does not seem to be recursive
     * NOTE: also adds other attributes and value pairs if they exist in the xml
     * EXAMPLE:
     * 	<items>
     <item title="orange" property="harry"/>
     <item title="blue" property="na"/>
     </items>
     * outputs: [{title:"orange", property:harry}, {title:"blue", property:"no"}]
     * TODO: Does it support xml string value?
     */
    
    //DEPRECATED
    
    static func toArray(_ xml:XML)->[[String:String]] {
        
        //⚠️️ you probably shouldn't use this method as it uses the old attibutes method. Try the method arr() instead, its recursive but should still work for 2d arrays
        
        var items:[[String:String]] = []
        let count = xml.children!.count//or use rootElement.childCount TODO: test this
        for i in 0..<count{
            let child:XML = XMLParser.childAt(xml.children!, i)!
            //print("Import - child.toXMLString(): " + child.toXMLString());
            var item:[String:String] = [String:String]()
            let attributes:[[String:String]] = XMLParser.attributes(child)//TODO: use: attribs instead
            for attribute in attributes {
                item[attribute["name"]!] = attribute["value"]!
            }
            if(child.stringValue != nil && child.stringValue!.count > 0) { item["xml"] = child.stringValue! }
            items.append(item)
        }
        return items
    }
    /**
     * Returns all attributes in PARAM: child
     * EXAMPLE: attributes.count// num of attributes
     * EXAMPLE: if(attributes.count > 0) {  print(attributes[0]["value"]) }//prints the first attribute value in the first child that has an attribute
     */
    static func attributes(_ child:XML) -> [[String:String]]{
        
        //print("you should probably not use this, use attribs instead")
        
        var attributes = [[String:String]]()
        if(child.attributes != nil && child.attributes!.count > 0){
            for node:XMLNode in child.attributes!{
                var attribute:[String:String] = [:]
                let name:String = node.name!
                let value:String = node.stringValue!
                //print("name: " + name + " " + "value:"+value)
                attribute["name"] = name//👈the problem is here.
                attribute["value"] = value//👈the problem is here.
                attributes.append(attribute)
            }
        }
        return attributes
    }
}
