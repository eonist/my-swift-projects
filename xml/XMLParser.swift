class XMLTraverser: NSObject, NSXMLParserDelegate {

    

    func parseXML( string: String, completion: (([[String : String]]) -> ())? ) {
        
    }

    func parserDidEndDocument(parser: NSXMLParser) {
        
    }

    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        
    }

    func parser(parser: NSXMLParser, foundCharacters string: String) {
		
    }

    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {

        if elementName == "category" {
            self.currentSubcategory = [String : String]()
        }
        else {
            self.currentElementName = elementName
        }
    }
}



let categoryParser = CategoryParser()
let xmlString = "<subCategories><category><id>someId</id><name>someName</name></category></subCategories>"
categoryParser.parseXML( xmlString ) { (categories) in
    print( categories )
}