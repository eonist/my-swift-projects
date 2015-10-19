import Foundation
class XMLParser{
	//import ../file/FileParser.swift
	//import ../network/NetworkParser.swift
	//import XMLTraverser.swift.swift
	/*
	 * Returns a tree-structures dictionary populated with xml data from an string with xml data
	 * PARAM: string:xml string data
	 * Note: this method is inspired by E4X (https://en.wikipedia.org/wiki/ECMAScript_for_XML)
	 * NOTE: here is how it works:
	 * 1. a dictionary stores two values under the keys "content" and "attributes"
	 * 2. content is a dictonary that stores many arrays, the node name is used as key, the value is an array that stores nodes of the same name
	 * 3. each array contains dictonaries that has 2 key/value pairs
	 * 4. if the content of a node is text then the content value will not be a dictonary but a string 
	 * EXAMPLE: XMLParser.data("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
	 * EXAMPLE XML: <media><book><novel/><biography/></book><music><cd/><cassette/></music><film><dvd/><vhs/><blueray/><dvd>movie.mkv</dvd></film><media>
	 * EXAMPLE XML: <categories><category>text goes here</category><!--if a sibling closes and moves to the next then did end elemnt is called--></category><category><item color:"blue" type:"car"></item><item>text goes here</item><item/><movie/><picture>img.jpg</picture><category/></categories><test></test> 
	 * NOTE: nsdelgate doc: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
	 * NOTE: root["."]["categories"][0]["."]["category"][0]["@"]["color"]//"green" that is an attribute value of color
	 * NOTE: root["."]["categories"][0]["."]["category"][0]//{@:{color:green,name:"tinits"},.:{item:[{attribute:{auther:john,age:2},content:"well designed car"},{},{}]}
	 * NOTE: root["."]["categories"][0]["."]["category"][0]["."]["item"][0]["."]//"well designed car" //i guess optional chaining would suit the bellow line well
	 * NOTE: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
	 * TODO: you can probably add the delgate object to the traverser for simplicity, and even make the traverse a pure static method
	 * TODO: may need to use infix operator and extensions to make the xml parser work.
     */
	class func data(xml:String)->Dictionary<String,Any>{
		var nsXmlDelegate:NSXMLDelegate = NSXMLParserDelegate()
		var traverser:XMLTraverser = XMLTraverser(data: string )
		traverser.delegate = nsXmlDelegate//:TODO: this may need to be passed in the method argument of the xml() cal
	   if(traverser.parse()){//init the parse process,returns true if succesfull or false if ere was an error
	   	return traverser.root//the root dictionary
	   }else{
	   	return nil
	   }
	}
	/*
	 * Returns a tree-structures dictionary populated with xml data from a file path (osx location for a .xml file)
	 * filePath:"//Users/<path>/someFile.xml"
	 * NOTE: NSXMLParser has a built in file reader: XMLTraverser(contentsOfURL: configURL ).  but then there is less code reuse in this method so jaut do it your swlf
	 */
	class func data(#filePath:String)->Dictionary{//# must use param naming
		let xml:String = FileParser.string(filePath)
		return data(xml)
	}
	/*
	 * Returns a tree-structures dictionary populated with xml data from an URL (http url for a .xml file)
	 * PARAM URL:"http://www.google.com/feeds/news.xml"
	 */
	class func data(#URL:String)->Dictionary{//# must use param naming
	  let result:String = NetworkParser.string(URL)
	  if(result.response = "success"){
	    return xml(result.data)
	  }else{
		 //print(result.error)
		 return nil
	  }
	}
	/*
	 * Returns a xml structured string with data from a tree-structured dictionary
	 * NOTE: xml(data)//xml string <categories><categories/> etc
	 * NOTE: with this method setup you can find any element or any content or any attribute etc. 
	 * PARAM data: a Dictionary like: root["."]["categories"][0]["."]["category"][0]["attributes"]["color"]/
	 * EXAMPLE: 
	 */
	class func xml(data:Dictionary)->String{
		var xmlString:String = ""
		for (nodeName,nodes) in data["."]{
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
	 * TODO: move to internal util class?
	 */
	func element(name:String,_ content:String,_ attributes:Dictionary)->String{
		var attributeText = ""
		for (key,value) in attributes{
			attributeText  (key + "=" + "\"" + value + "\"")
			if (attribute != attributes.last ){
				attributeText += " " //append a space after each key value pair, unless its at the end
			}
		}
		var xmlText:String = "<" + name + " " + attributeText //beginning of xml text
		if (content.count > 0) { //has content
			xmlText += ">" + content + "</" + name + ">" //end of xml text
		else {//no content
			xmlText += "/>" //end of xml text
		}
		return xmlText
	}
	/**
	 * Returns all children from the content of an xml node
	 */
	class func children(dictionary:Dictionary)->Array{
		var theChildren:Array = []
		for value in dictionary.values{
			theChildren += value
		}
		return theChildren
	}
}