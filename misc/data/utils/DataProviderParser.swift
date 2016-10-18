import Foundation

class DataProviderParser {
    /**
     * TODO: Use a real Range type here
     */
    class func itemsInRange(start:Int, _ end:Int,_ items:[Dictionary<String,String>])->[Dictionary<String,String>]{
        var theItems:[Dictionary<String,String>] = []
        for var i = start; i < end; ++i{
            theItems.append(items[i])
        }
        return theItems
    }
    /**
     *
     */
    class func itemByProperty(dataProvider:DataProvider,_ property:String) -> Dictionary<String, String>?{
        for object in dataProvider.items {
            if(object["property"] == property) {return object}
        }
        //fatalError("NO ITEM WITH THE PROPERTY OF: "+property);
        return nil
    }
    //getItemAtIndex
    /**
     * Returns an XML instance from @param dataProvider
     * NOTE: the is the reverse algorithm as XMLParser.parseXMLToArray(xml);
     */
    static func xml(dataProvider:DataProvider,_ rootName:String = "items") -> XML {
        let xml:XML = "<\(rootName)></\(rootName)>".xml
        for (var i:Int = 0; i < dataProvider.items.count; i++) {
            var item = dataProvider.items[i]
            
            var child:XML = "<item></item>".xml
            item.forEach{
                XMLModifier.setAttributeAt(<#T##xml: NSXMLElement##NSXMLElement#>, <#T##index: Array<Int>##Array<Int>#>, <#T##attributes: Dictionary<String, String>##Dictionary<String, String>#>)
            }
            
            //Continue here: add all attributes to the item, look at the repolist.xml first
            
            //if(typeof(item["xml"]) == "xml") child = DataProviderParser.xml(DataProvider(item["xml"]))
            //for (var val:* in item) if(typeof(item[val]) == "string") {child["@"+val] = item[val]}
            xml.appendChild(child)
        }
        return xml
    }
    //childrenCount
}