//import ../file/FileParser.swift
//import ../network/NetworkParser.swift


//// :TODO: to access sub nodes etc we could probably make some utils that will traverse the multi dim array
// :TODO: also make a method that can turn the muli dim acociative array into valid xml data
/*
 * Returns a Dictonary with a tree structure of the data in an xml doc
 * PARAM: string:xml string data
 * NOTE: here is how it works:
 * 1. a dictionary stores two values under the keys "content" and "attributes"
 * 2. content is a dictonary that stores many arrays, the node name is used as key, the value is an array that stores nodes of the same name
 * 3. each array contains dictonaries that has 2 key/value pairs
 * 4. if the content of a node is text then the content value will not be a dictonary but a string 
 * EXAMPLE: XMLParser.data("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
 * NOTE: nsdelgate doc: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
 * NOTE: root["content"]["categories"][0]["content"]["category"][0]["attributes"]["color"]//"green" that is an attribute value of color
 * NOTE: root["content"]["categories"][0]["content"]["category"][0]//{attributes:{color:green,name:"tinits"},content:{item:[{attribute:{auther:john,age:2},content:"well designed car"},{},{}]}
 * NOTE: root["content"]["categories"][0]["content"]["category"][0]["content"]["item"][0]["content"]//"well designed car" //i guess optional chaining would suit the bellow line well
 * TODO: you can probably add the delgate object to the traverser for simplicity, and even make the traverse a pure static method
 */
func data(xml:String)->Dictionary{
	var nsXmlDelegate:NSXMLDelegate = NSXMLParserDelegate()
	var traverser = XMLTraverser(data: string )
	traverser.delegate = nsXmlDelegate//:TODO: this may need to be passed in the method argument of the xml() cal
   if( traverser.parse()){//init the parse process,returns true if succesfull or false if ere was an error
   	return traverser.root//the root dictionary
   }else{
   	return nil
   }
}
/*
 * filePath:"//Users/<path>/someFile.xml"
 * NOTE: NSXMLParser has a built in file reader: XMLTraverser(contentsOfURL: configURL ).  but then there is less code reuse in this method so jaut do it your swlf
 */
func data(#filePath:String)->Dictionary{//# must use param naming
	let xml:String = FileParser.string(filePath)
	data(xml)
}
/*
 * url:"http://www.google.com/feeds/news.xml"
 */
func data(#URL:String)->Dictionary{//# must use param naming
  var result = NetworkParser.string(URL)
  if(result.response = "success"){
    return xml(result.data)
  }else{
	 print(result.error)
	 return nil
  }
}
/*
 * Returns xml from PARAM: data
 * 
 * NOTE: xml(data)//xml string <categories><categories/> etc
 * with this method setup you can find any element or any content or any attribute etc. 
 * PARAM data: a Dictionary like: root["content"]["categories"][0]["content"]["category"][0]["attributes"]["color"]/
 * EXAMPLE: 
 */
func xml(data:Dictionary)->String{
	var xmlString:String = ""
	for (nodeName,nodes) in data["content"]{
		for node in nodes{
			xmlString += element(nodeName, xml(node), node["@"])
		}
	}
	return xmlString
}
/*
 * Returns xml like: <item color="blue" age="2">some text goes here<item/>
 * PARAM content: text
 * PARAM attributes: ["color":"blue","age":"2"]
 * PARAM name: the name of the xml node: "item"
 */
func element(name:String,content:String,attributes:Dictionary)->String{
	set attributeText to ""
	for (key,value) in attributes{
		var attributeText:String +=  (key + "=" + "\"" + value + "\"")
		if (attribute != attributes.last ){
			set attributeText to attributeText + " " //append a space after each key value pair, unless its at the end
		}
	}
	var xmlText:String = "<" + name + " " + attributeText //beginning of xml text
	if (content.length > 0) { //has content
		set xmlText to xmlText + ">" + content + "</" + name + ">" //end of xml text
	else {//no content
		set xmlText to xmlText + "/>" //end of xml text
	}
	return xmlText
}
/*
 * Traverses xml data 
 * NOTE: nsxmlparser help: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/index.html#//apple_ref/occ/instm/NSXMLParser/initWithContentsOfURL:
 */
class XMLTraverser: NSObject, NSXMLParser{
	var hasClosed = false//you step into an xml so this must be false
	var prevEnteredNodeName:String?
	var root:Dictionary = ["content":[:]]
	var openParents:Array = [root["content"]]//flat list of previous entered parents aka openParents
	var tempNode:Dictionary//this may not be needed to be declared here, if you have the parent you can get to this aswell
    
    //delegate handlers:
    
    /*
	  * enter node
	  */
    func parser(parser: NSXMLParser, didStartElement elementName nodeName: String, namespaceURI: String?, qualifiedName qName: String?, attributes : [String : String]) {
      var tempParent:Dictionary = openParents.last
		tempParent[nodename] = tempParent[nodename] == nil ? [] : tempParent[nodename]//siblings of the same node name does not exist, create and add an array to store siblings of the same nodeName
		tempNode = ["@":attributes]
		tempNode["content"] = [:]//this can potentially be String, but then you just set it to string in the exit method
		tempParent[nodename].append(tempNode["content"])
		if(hasClosed){//means the item is an sibling
			//which means you dont add the parent to the parentList
		}else{//means you stepped into a subnode
			openParents.append(tempNode["content"])//parent must always be the content dictionary
		}
		prevEnteredNodeName = nodeName
		hasClosed = false
    }
    /*
	  * found string content
	  */
    func parser(parser: NSXMLParser, foundCharacters string: String) {
		stringContent += foundCharacters
    }
	 /*
	  * exit node
	  */
    func parser(parser: NSXMLParser, didEndElement elementName nodeName: String, namespaceURI: String?, qualifiedName qName: String?) {
	   if(nodeName == prevEnteredNodeName && !hasClosed){//means you closed the element you just entered (no children,but has potential string content)
			if(!stringContent.isEmpty){
				tempNode["content"] = stringContent
			}
		}else{//means you exit an elemnt back one level (had children)
			openParents.removeLast()//you close a parent
		}
		hasClosed = true
	}
    /*
	  * error
	  */
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        //not needed
    }
    /*
	  * complete
	  */
    func parserDidEndDocument(parser: NSXMLParser) {
        //not needed
    }
}
