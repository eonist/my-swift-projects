/*
 * Example: XMLParser.xml("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
 */
func xml(string:String)->Dictionary{
	var traverser = XMLTraverser(data: string )
	traverser.delegate = self//this may need to be passed in the method argument of the xml() cal
   traverser.parse()//init the parse proces
}
/*
 * 
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
 * 
 */
func xml(#URL:String)->Dictionary{//# must use param naming
	//url stuff, nsurl

	
	

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


















