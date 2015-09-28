/*
 * Example: XMLParser.xml("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
 */
func xml(string:String)->Dictionary{
	var nsXmlDelegate:NSXMLDelegate = NSXMLParserDelegate()
	var traverser = XMLTraverser(data: string )
	traverser.delegate = nsXmlDelegate//this may need to be passed in the method argument of the xml() cal
   traverser.parse()//init the parse proces
}
/*
 * filePath:"//Users/<path>/someFile.xml"
 */
func xml(#filePath:String)->Dictionary{//# must use param naming
	//filepath stuuf
	// :TODO: nsxml may support the data handling part
	//load the string
	//xml(string)
	var traverser = XMLTraverser(contentsOfURL: configURL )
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
 
  let result = NSURLConnection.sendAsynchronousRequest(rssUrlRequest, queue: queue) {
  if(result.response = "success"){
    (response, data, error) -> Void in
    self.xmlParser = NSXMLParser(data: data)
    self.xmlParser.delegate = self
    self.xmlParser.parse()
  }else{
  
  }
}
/*
 * Traverses xml data 
 */
class XMLTraverser: NSObject, NSXMLParserDelegate {
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



let categoryParser = CategoryParser()
let xmlString = "<subCategories><category><id>someId</id><name>someName</name></category></subCategories>"
categoryParser.parseXML( xmlString ) { (categories) in
    print( categories )
}


















