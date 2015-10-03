/*
 * Traverses xml data 
 * NOTE: nsxmlparser help: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/index.html#//apple_ref/occ/instm/NSXMLParser/initWithContentsOfURL:
 */
class XMLTraverser: NSObject, NSXMLParser{
	var hasClosed = false//you step into an xml so this must be false
	var prevEnteredNodeName:String?
	var root:Dictionary = [".":[:]]
	var openParents:Array = [root["."]]//flat list of previous entered parents aka openParents
	var tempNode:Dictionary//this may not be needed to be declared here, if you have the parent you can get to this aswell
    
    // MARK: - delegate handlers
    /*
	  * enter node
	  */
    func parser(parser: NSXMLParser, didStartElement elementName nodeName: String, namespaceURI: String?, qualifiedName qName: String?, attributes : [String : String]) {
      var tempParent:Dictionary = openParents.last
		tempParent[nodename] = tempParent[nodename] == nil ? [] : tempParent[nodename]//siblings of the same node name does not exist, create and add an array to store siblings of the same nodeName
		tempNode = ["@":attributes]
		tempNode["."] = [:]//this can potentially be String, but then you just set it to string in the exit method
		tempParent[nodename].append(tempNode["."])
		if(hasClosed){//means the item is an sibling
			//which means you dont add the parent to the parentList
		}else{//means you stepped into a subnode
			openParents.append(tempNode["."])//parent must always be the content dictionary
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
				tempNode["."] = stringContent
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