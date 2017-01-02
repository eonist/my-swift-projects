import Foundation

class DataProviderParser {
    /**
     * TODO: Use a real Range type here
     */
    class func itemsInRange(start:Int, _ end:Int,_ items:[Dictionary<String,String>])->[Dictionary<String,String>]{
        var theItems:[Dictionary<String,String>] = []
        for var i = start; i < end; ++i{//update to swift 3 syntax
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
    /**
     * Returns an XML instance from @param dataProvider
     * NOTE: the is the reverse algorithm as XMLParser.parseXMLToArray(xml)
     */
    static func xml(dataProvider:DataProvider) -> XML {
        let xml = "<items></items>".xml
        for (var i:Int = 0; i < dataProvider.items.count; i++) {
            let item = dataProvider.items[i]
            let child = "<item></item>".xml
            for attr:(key:String,value:String) in item{
                child[attr.key] = attr.value//add all attributes to the item
            }
            xml.appendChild(child)
        }
        return xml
    }
}
//getItemAtIndex
//childrenCount