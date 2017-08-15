import Foundation

class XMLUtils {
    /**
     * Returns a tree-structures dictionary populated with xml data from an string with xml data
     * PARAM: string:xml string data
     * NOTE: this method is inspired by E4X (https://en.wikipedia.org/wiki/ECMAScript_for_XML)
     * NOTE: nsdelgate doc: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
     * NOTE: root["."]["categories"][0]["."]["category"][0]["@"]["color"]//"green" that is an attribute value of color
     * NOTE: root["."]["categories"][0]["."]["category"][0]//{@:{color:green,name:"tinits"},.:{item:[{attribute:{auther:john,age:2},content:"well designed car"},{},{}]}
     * NOTE: root["."]["categories"][0]["."]["category"][0]["."]["item"][0]["."]//"well designed car" //i guess optional chaining would suit the bellow line well
     * NOTE: here is how it works:
     * 1. a dictionary stores two values under the keys "content" and "attributes"
     * 2. content is a dictonary that stores many arrays, the node name is used as key, the value is an array that stores nodes of the same name
     * 3. each array contains dictonaries that has 2 key/value pairs
     * 4. if the content of a node is text then the content value will not be a dictonary but a string
     * EXAMPLE: XMLParser.data("<subCategories><category><id>someId</id><name>someName</name></category></subCategories>")["content"]["subCategories"][0]["comtent"] etc
     * EXAMPLE XML: <media><book><novel/><biography/></book><music><cd/><cassette/></music><film><dvd/><vhs/><blueray/><dvd>movie.mkv</dvd></film><media>
     * EXAMPLE XML: <categories><category>text goes here</category><!--if a sibling closes and moves to the next then did end elemnt is called--></category><category><item color:"blue" type:"car"></item><item>text goes here</item><item/><movie/><picture>img.jpg</picture><category/></categories><test></test>
     * TODO: you can probably add the delgate object to the traverser for simplicity, and even make the traverse a pure static method
     * TODO: may need to use infix operator and extensions to make the xml parser work.
     */
    static func data(_ xml:String)->[String:Any]?{
        //⚠️️ in the future this method should return a dictionary/array treestructure described in the comments above. The design is sound, you have the code. just build it when you need it
        return nil
    }
    /**
     * Returns a tree-structures dictionary populated with xml data from a file path (osx location for a .xml file)
     * filePath:"//Users/<path>/someFile.xml"
     * NOTE: NSXMLParser has a built in file reader: XMLTraverser(contentsOfURL: configURL ).  but then there is less code reuse in this method so jaut do it your swlf
     */
    static func xmlByFilePath(_ filePath:String)->XMLDoc?{//# must use param naming
        //implement when you need it
        let xml:String = FileParser.content(filePath)!
        print(xml)
        fatalError("not implemented yet")
        //return nil
    }
    /*
     * Returns a tree-structures dictionary populated with xml data from an URL (http url for a .xml file)
     * PARAM: URL:"http://www.google.com/feeds/news.xml"
     * NOTE: you can also use: FileParser.xml
     */
    static func xmlByURL(_ URL:String)->XMLDoc?{//# must use param naming
        let result:String = NetworkParser.string(URL)
        if(result == "success"){
            let xmlDoc:XMLDoc = try! XMLDoc(xmlString: result, options: XMLNode.Options(rawValue: 0))
            return xmlDoc
        }else{
            //print(result.error)
            return nil
        }
    }
    /*
     * Compose xml syntax as a string derived from NSXMLelement or alike
     * NOTE: Out of order for now
     */
    static func xmlString(_ data:[String:Any])->String?{
        /*
        var xmlString:String = ""
        for (nodeName, nodes) in data["."]{
            for node in nodes{
                xmlString += element(nodeName, xml(node), node["@"])
            }
        }
        return xmlString
        */
        fatalError("not implemented yet")
        //return nil
    }
    /*
     * Returns xml like: <item color="blue" age="2">some text goes here<item/>
     * PARAM: content: text
     * PARAM: attributes: ["color":"blue","age":"2"]
     * PARAM: name: the name of the xml node: "item"
     * TODO: move to internal util class?
     */
    static func element(_ name:String,_ content:String,_ attributes:[String:String])->String{
        var attributeText = ""
        for (key,value) in attributes{
            var attributeText  = (key + "=" + "\"" + value + "\"")
            attributeText += " " //append a space after each key value pair
        }
        attributeText.remove(at: attributeText.characters.indices.last!)//remove trailing space
        var xmlText:String = "<" + name + " " + attributeText //beginning of xml text
        if (content.characters.count > 0) { //has content
            xmlText += ">" + content + "</" + name + ">" //end of xml text
        }else {//no content
            xmlText += "/>" //end of xml text
        }
        return xmlText
    }
    /**
    *
    From the enum: NSXMLNodeKind
    
    case InvalidKind
    case DocumentKind
    case ElementKind
    case AttributeKind
    case NamespaceKind
    case ProcessingInstructionKind
    case CommentKind
    case TextKind
    case DTDKind
    case EntityDeclarationKind
    case AttributeDeclarationKind
    case ElementDeclarationKind
    case NotationDeclarationKind
    }
     */
    static func types(){
    }
}
