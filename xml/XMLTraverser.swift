import Foundation
/*
 * Traverses xml data 
 * NOTE: nsxmlparser help: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/index.html#//apple_ref/occ/instm/NSXMLParser/initWithContentsOfURL:
 */
class XMLTraverser: NSXMLParser{//NSObject,
	var hasClosed = false//you step into an xml so this must be false
	var prevEnteredNodeName:String?
	var root:[Dictionary<String,Any>] = []
	var openParents:[Dictionary<String,Any>] = []//flat list of previous entered parents aka openParents
	var tempNode:Dictionary<String,Any>//this may not be needed to be declared here, if you have the parent you can get to this aswell
    // MARK: - delegate handlers
    override init(data: NSData) {
        <#code#>
    }
    /*
     * enter node
     */
    func parser(parser: NSXMLParser, didStartElement elementName : String, namespaceURI: String?, qualifiedName qName: String?, attributes : [String : String]) {
        let nodeName:String = elementName
        var tempParent:Dictionary<String,Any> = ArrayParser.last(openParents)
        tempParent[nodeName] = tempParent[nodeName] == nil ? [Dictionary<String,Any>]() : tempParent[nodeName]//siblings of the same node name does not exist, create and add an array to store siblings of the same nodeName
		tempNode = ["@":attributes]
		tempNode["."] = [:]//this can potentially be String, but then you just set it to string in the exit method
        var temp:[Dictionary<String,Any>] = tempParent[nodeName] as! [Dictionary<String,Any>]
        temp.append(tempNode["."] as! Dictionary<String,Any>)
        
		if(hasClosed){//means the item is an sibling
			//which means you dont add the parent to the parentList
		}else{//means you stepped into a subnode
			openParents.append(tempNode["."] as! Dictionary<String,Any>)//parent must always be the content dictionary
		}
		prevEnteredNodeName = nodeName
		hasClosed = false
    }
    /*
     * found string content
     */
    func parser(parser: NSXMLParser, foundCharacters: String) {
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