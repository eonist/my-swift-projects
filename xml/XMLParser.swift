/*
 * Example: XMLParser.xml("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
 * NOTE: nsdelgate doc: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
 */
func xml(string:String)->Dictionary{
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
 */
func xml(#filePath:String)->Dictionary{//# must use param naming
	let theFilePath:NSURL = NSURL(filePath)
	var traverser = XMLTraverser(contentsOfURL: configURL )//contentsOfURL url: NSURL
	traverser.delegate = self//this may need to be passed in the method argument of the xml() cal
   traverser.parse()//init the parse proces
}
/*
 * url:"http://www.blubrry.com/feeds/onorte.xml"
 */
func xml(#URL:String)->Dictionary{//# must use param naming
	//url stuff, nsurl
  let urlString = NSURL(string: “http://www.blubrry.com/feeds/onorte.xml")
  let rssUrlRequest:NSURLRequest = NSURLRequest(URL:urlString!)
  let queue:NSOperationQueue = NSOperationQueue()
  //the bellow is sudo code
  let result = NSURLConnection.sendAsynchronousRequest(rssUrlRequest, queue: queue) {
  if(result.response = "success"){
    xml(result.data)
  }else{
	 print(result.error)
  }
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
	
    /*
	  * enter node
	  */
    func parser(parser: NSXMLParser, didStartElement elementName nodeName: String, namespaceURI: String?, qualifiedName qName: String?, attributes : [String : String]) {
        if elementName == "category" {
            self.currentSubcategory = [String : String]()
        }
        else {
            self.currentElementName = elementName
        }
    }
    /*
	  * found string content
	  */
    func parser(parser: NSXMLParser, foundCharacters string: String) {
		
    }
	 /*
	  * exit node
	  */
    func parser(parser: NSXMLParser, didEndElement elementName nodeName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
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


















