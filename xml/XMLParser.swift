class XMLTraverser: NSObject, NSXMLParserDelegate {

    

    func parseXML( string: String, completion: (([[String : String]]) -> ())? ) {
        guard let data = string.dataUsingEncoding( NSUTF8StringEncoding ) else {
            fatalError( "Base XML data" )
        }
        self.completion = completion
        let parser = NSXMLParser(data: data )
        parser.delegate = self
        parser.parse()
    }

    func parserDidEndDocument(parser: NSXMLParser) {
        self.completion?( self.subcategories )
    }

    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print( "Parse error: \(parseError)" )
    }

    func parser(parser: NSXMLParser, foundCharacters string: String) {

        if let elementName = self.currentElementName {
            if [ "id", "name" ].contains( elementName ) {
                self.currentSubcategory?[ elementName ] = string
            }
        }
    }

    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "category", let subcategory = self.currentSubcategory {
            self.subcategories.append( subcategory )
            self.currentSubcategory = nil
        }
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