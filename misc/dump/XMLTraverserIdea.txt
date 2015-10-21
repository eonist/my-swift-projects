
//root should be a Dictionary



class Podcast: NSObject {
    var podcastTitle = String()
    var podcastDate = String()
    //var podcastLinkInfo = PodcastLinkInfo()
    var podcastDuration = String()
    var podcastSubtitle = String()
    var podcastDescription = String()
    var podcastAudio = NSData()
}

class CustomXMLParser : NSObject, NSXMLParserDelegate{
    var xmlStr:String = ""
    var xmlParser: NSXMLParser!
    var hasClosed = false//you step into an xml so this must be false
    var openParents:[Dictionary<String,Any>] = []//flat list of previous entered parents aka openParents
    var tempNode:Dictionary<String,Any> = [:]//this may not be needed to be declared here, get it via parent?
    //rest of code for your controller here
    /**
     *
     */
    init(_ xmlStr:String){
        self.xmlStr = xmlStr
        //print("init")
        super.init()
        let data:NSData = xmlStr.dataUsingEncoding(NSUTF8StringEncoding)!
        self.xmlParser = NSXMLParser(data: data)
        self.xmlParser.delegate = self
        self.xmlParser.parse()
    }
    func parserDidStartDocument(parser: NSXMLParser) {
        print("start")
    }
    @objc func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("didStartElement: " + elementName)
        tempNode = ["@":attributeDict]
        tempNode["value"] = [:]//the value is always a Dictionary
        
        
        
        
        //continue here, try to make the openParents concept working.
        
        
        
        
        
        if(hasClosed){//means the item is an sibling
            //which means you dont add the parent to the parentList
        }else{//means you stepped into a subnode
            openParents.append(tempNode)
        }
        
        
        /*
        if elementName == "item" {
            weAreInsideAnItem = true
        }
        if weAreInsideAnItem {
            switch elementName {
            case "title":
                entryTitle = String()
                currentParsedElement = "title"
            case "itunes:summary":
                entryDescription = String()
                currentParsedElement = "itunes:summary"
            default: break
            }
        }
        */
    }
    @objc func parser(parser: NSXMLParser, foundCharacters string: String) {
        print("foundCharacters: " + string)
        /*
        if weAreInsideAnItem {
            switch currentParsedElement {
            case "title":
                entryTitle = entryTitle + string
                
            case "itunes:summary":
                entryDescription = entryDescription + string
                
            default: break
            }
        }
        */
    }
    @objc func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("didEndElement: " + elementName)
        /*
        if weAreInsideAnItem {
            switch elementName {
            case "title":
                currentParsedElement = ""
                
            case "itunes:summary":
                currentParsedElement = ""
            default: break
            }
            if elementName == "item" {
                let entryPodcast = Podcast()
                entryPodcast.podcastTitle = entryTitle
                entryPodcast.podcastDescription = entryDescription
                podcasts.append(entryPodcast)
                weAreInsideAnItem = false
            }
        }
        */
    }
    @objc func parserDidEndDocument(parser: NSXMLParser) {
        print("end")
    }
}
class Test: NSObject, NSXMLParserDelegate {
    
}
