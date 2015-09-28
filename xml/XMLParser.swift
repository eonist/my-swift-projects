/*
 * 
 */
func xml(string:String)->Dictionary{

}
/*
 * 
 */
func xml(filePath:String)->Dictionary{
	
}
/*
 * 
 */
func xml(URL:String)->Dictionary{
	
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


















