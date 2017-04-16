import Foundation

class DataProviderParser {
    /**
     * TODO: Use a real Range type here
     */
    static func itemsInRange(_ start:Int, _ end:Int,_ items:[[String:String]]) -> [[String:String]]{
        /*var theItems:[Dictionary<String,String>] = []
         
         for i in start..<end{//swift 3 upgrade, we could also use subRange here -> arr[start..<end]
         theItems.append(items[i])
         }
         return theItems*/
        return items.slice2(start, end)
    }
    /**
     *
     */
    static func itemByProperty(_ dp:DataProvidable,_ property:String) -> [String:String]?{
        for object in dp.items {
            if(object["property"] == property) {return object}
        }
        //fatalError("NO ITEM WITH THE PROPERTY OF: "+property);
        return nil
    }
    /**
     * Returns an XML instance from PARAM: dataProvider
     * NOTE: the is the reverse algorithm as XMLParser.parseXMLToArray(xml)
     */
    static func xml(_ dp:DataProvidable) -> XML {
        let xml = "<items></items>".xml
        for i in 0..<dp.items.count{//swift 3 upgrade
            let item = dp.items[i]
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
