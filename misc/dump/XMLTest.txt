//xml parsing test
//https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/NSXMLParserDelegate_Protocol/index.html#//apple_ref/occ/intfm/NSXMLParserDelegate/parser:foundCharacters:
//https://github.com/tadija/AEXML
//xmlparser lib: https://github.com/Mozharovsky/XMLParser. (doesnt support attributes)
//try this tut http://www.ihartdevelopers.com/xml-parsing-using-nsxmlparser-in-swift/
//great explination of how nsxml works https://medium.com/@lucascerro/understanding-nsxmlparser-in-swift-xcode-6-3-1-7c96ff6c65bc

//ok so here is how the xml parser works. it runs through an xml displayObjectContainer and triggers the different elements in the doc. the element, the content.
//so to access the different parts you need to store the different parts in dictionaries and arrays. 


//the concept: 
//TODO: what if you combine array and dictionary to: settingsXml["picture"][2]["file"][0]["content"]



//solution: (continue here)
//here is the deal if an item closes then the parent should be set one level back
//if an item opens then you set this element as the parent
//now how do you get one level back again?? just think about in the sense of an multi dim array
//you do it by keeping teack of the over all multi dim array depth index. dont think about the dictionaries, 
//you need to keep track of where you are

curentKeyDepth = []
curIndexDepth = []


//when you enter an element
	curentKeyDepth.append(elementName)
	curIndexDepth.append(children.count-1)//last index
	//you also need to assume that you will maybe enter into a child in the next call to this method
	//so you need to set this node as the parent
//when you exit an element
	curentKeyDepth.removeLast()
	//if you exit an element and the elementName equals the parentNodeName aka category etc
		//then that means you are back one level
		curIndexDepth.removeLast()
	//else if you exit an element and the elementName is the same name as lasEnteredElementName 
		//then that means you closed 
		




/*Solution:*/

//this would be so much easier to do recursivly, so why not think recursivly?
// :TODO: setup the final result and try to make a parser that makes it into xml, could help in giving you a new idea on how to solve this
// :TODO: then you apply the same idea but by using flags etc
// :TODO: i think the best idea is to use an indexDepth  

//indeciesOfOpenNodes
//openParents

//enter element
	//if the hasClosed flag is true
		//then that means the item is an sibling
	//else
		//then that means you stepped into a subnode
		//add last index in the currentNode to the indeciesOfOpenNodes array
		
//exit element
	//if the elementName is the same as lastEnteredElementName 
		//then that means you closed the element you just entered (no children)
	//else 
		//then that means you exit an elemnt back one level (had children)
		//remove last index in the indeciesOfOpenNodes array



<media>
	<book>
		<novel/>
		<biography/>
	</book>
	<music>
		<cd/>
		<cassette/>
	</music>
	<film>
		<dvd/>
		<vhs/>
		<blueray/>
		<dvd>
				movie.mkv
		</dvd>
	</film>
<media>
		
<categories>
	<category>text goes here</category><!--if a sibling closes and moves to the next then did end elemnt is called-->
	</category>
	<category>
		<item color:"blue" type:"car"></item>
		<item>text goes here</item>
		<item/>
		<movie/>
		<picture>img.jpg</picture>
	<category/>
</categories>
<test>
</test>



//idea written from my iPhone: 
//then later implement a class to hold the different values, dynamic properties etc, and getContent for the content but later


var hasClosed = false//you step into an xml so this must be false
var prevEnteredNodeName:String?
var root:Dictionary = ["content":[:]]
var openParents:Array = [root["content"]]//flat list of previous entered parents aka openParents
var tempNode:Dictionary//this may not be needed to be declared here, if you have the parent you can get to this aswell
func enter(nodeName:String,attributes:Dictionary){
	var tempParent:Dictionary = openParents.last
	tempParent[nodename] = tempParent[nodename] == nil ? [] : tempParent[nodename]//siblings of the same node name does not exist, create and add an array to store siblings of the same nodeName
	tempNode = ["attributes":attributes]
	tempNode["content"] = [:]//this can potentially be String, but then you just set it to string in the exit method
	tempParent[nodename].append(tempNode["content"])
	if(hasClosed){//means the item is an sibling
		//which means you dont add the parent to the parentList
	}else{//means you stepped into a subnode
		openParents.append(tempNode["content"])//parent must always be the content dictionary
	}
	prevEnteredNodeName = nodeName
	hasClosed = false
}
func read(characters:String){
	stringContent += characters
}
func exit(nodeName:String){
	if(nodeName == prevEnteredNodeName && !hasClosed){//means you closed the element you just entered (no children,but has potential string content)
		if(!stringContent.isEmpty){
			tempNode["content"] = stringContent
		}
	}else{//means you exit an elemnt back one level (had children)
		openParents.removeLast()//you close a parent
	}
	hasClosed = true
}

root["content"]["categories"][0]["content"]["category"][0]["attributes"]["color"]//"green" that is an attribute value of color
root["content"]["categories"][0]["content"]["category"][0]//{attributes:{color:green,name:"tinits"},content:{item:[{attribute:{auther:john,age:2},content:"well designed car"},{},{}]}
root["content"]["categories"][0]["content"]["category"][0]["content"]["item"][0]["content"]//"well designed car" //i guess optional chaining would suit the bellow line well:

//Note: you may not need to keep track of curKeyDepth, since when you exit you also get the name of that exit node, yes this is true
//Note: but you do need to keep track of where you are multi dim array wise


//NOTE: if you have an attr named content and the child value needs to be inside content then to differentiate the two you need to rename the attr to somethin unique, this is out of the scope for this method though, so in that case just dont parse xmls with attr named content, if you do have to do it then just wrap this method into another with this extended functionality.
//this is how you should navigate the result:

//here is how it works:
//1. dictionaries store arrays of xml nodes of the same name
//2. dictionaries inside an array item store attributes and content of the xml node
//3. xml node content is stored in the dictionary under the key "content"
//4. content is stored as a string if its just text or as a dictonary with arrays of xml children (begin again from 1)

//in swift:
//var depth:Int = 0;//current node depth
var nodes:Dictionary = [:]//current nodes
var parentNodes:Dictionary = nodes
var stringContent:String = ""//init the string to be stored
var prevElementName:String = ""
var curOpenElementName:String = ""
var hasClosed = false//has child closed

func parser(didStartElement elementName: String,namespaceURI: String?,qualifiedName: String?,attributes attributeDict: [NSObject : AnyObject]){	
	if(parentNodes[elementName] == nil){//if there is no array accociated with elementName, then add a new array to store children with the elementName
		var children:Array = []//list of children, create a new array to store all children with elementName
		parentNodes[elementName] = children//create a new key/value pair to store all children with elementName
		var currentChild:Dictionary = attributes//add attributes to the dictionary :TODO: make sure this value isnt nil
		currentChild["content"] = [:]//create the content key
		parentNodes[elementName].append(currentChild)//add the node to the parent with the key of elementName
		parentNodes = nodes
		nodes = currentChild["content"]
	}else{//an array for elementName already exists, so this item must be a sibbling
		//add the 
		//do not set parent to current node etc
		var currentChild:Dictionary = attributes//add attributes to the dictionary :TODO: make sure this value isnt nil
		currentChild["content"] = [:]//create the content key
		parentNodes[elementName].append(currentChild)//add the node to the parent with the key of elementName
	}
	if(hasClosed == false){//means that your still inside a child
		//add a dictionary for key "content"
	}else(hasClosed == true){//means that you have moved to the next child
	
	}
}
func parser(foundCharacters: string: String?){
	//append string
	//if this is called then the element has a string in its body
	stringContent += foundCharacters
}
func parser(didEndElement elementName: String,namespaceURI: String?,qualifiedName qName: String){
	//append objects
	if (stringContent.isEmpty == false){
		parentNodes[elementName][parentNodes[elementName].count-1]["content"] = stringContent// :TODO: you should probably use a pointer ref here research further
		stringContent = ""//empty the string
	}else{//had nomcontent or complex content
		
	}
	if (elementName == curOpenElemntName){
		//close the child
		
		hasClosed = true//current node was closed
	}
	//depth--;
}
	
//less important:
//parserDidStartDocument: 
	//init objects
//parserDidEndDocument:
	//return objects
//parser:didStartMappingPrefix:toURI:
//parser:didEndMappingPrefix:
//parser:resolveExternalEntityName:systemID:
//parser:parseErrorOccurred:
//parser:validationErrorOccurred:










//access an attribute:
//in didStartElement method;

if element.isEqualToString("enclosure") {
  var imgLink = attributeDict["url"] as String
}






//other peoples work:
import Foundation
import Cocoa

let path = "//Users/<path>/someFile.xml"

var err: NSError?
let content = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &err)


//get filepath
The NSXMLDocument usage would look like:

let fm = NSFileManager.defaultManager()
var err : NSError?
let userDirectory = fm.URLForDirectory(.UserDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false, error: &err)
if err != nil {
  // ...
}

if let path = userDirectory?.URLByAppendingPathComponent("someFile.xml") {
  NSXMLDocument(contentsOfURL: configURL, options: 0, error: &err)
  if err != nil {
    // ...
  }

  if let rootNode = config?.rootElement() {
    // ...
  }
}

//try the bellow:

class CategoryParser: NSObject, NSXMLParserDelegate {

    var subcategories = [[String : String]]()
    var currentSubcategory: [String : String]?
    var currentElementName: String?

    var completion: (([[String : String]]) -> ())?

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