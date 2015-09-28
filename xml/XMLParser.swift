/*
 * Example: XMLParser.xml("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
 * NOTE: nsdelgate doc: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
 */
func xml(string:String)->Dictionary{
	var nsXmlDelegate:NSXMLDelegate = NSXMLParserDelegate()
	var traverser = XMLTraverser(data: string )
	traverser.delegate = nsXmlDelegate//:TODO: this may need to be passed in the method argument of the xml() cal
   traverser.parse()//init the parse proces
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
    xml(data)
  }else{
	 print(result.error)
  }
}
/*
 * Traverses xml data 
 * NOTE: nsxmlparser help: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/index.html#//apple_ref/occ/instm/NSXMLParser/initWithContentsOfURL:
 */
class XMLTraverser: NSObject, NSXMLParser{
	 /*
	  * found string content
	  */
    func parser(parser: NSXMLParser, foundCharacters string: String) {
		
    }
    /*
	  * enter node
	  */
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "category" {
            self.currentSubcategory = [String : String]()
        }
        else {
            self.currentElementName = elementName
        }
    }
	 /*
	  * exit node
	  */
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    /*
	  * error
	  */
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        
    }
    /*
	  * complete
	  */
    func parserDidEndDocument(parser: NSXMLParser) {
        
    }
}


















