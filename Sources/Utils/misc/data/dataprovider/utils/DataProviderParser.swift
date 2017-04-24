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
    static func itemByProperty(_ dataProvider:DataProvider,_ property:String) -> [String:String]?{
        for object in dataProvider.items {
            if(object["property"] == property) {return object}
        }
        //fatalError("NO ITEM WITH THE PROPERTY OF: "+property);
        return nil
    }
    /**
     * Returns an XML instance from PARAM: dataProvider
     * NOTE: the is the reverse algorithm as XMLParser.parseXMLToArray(xml)
     */
    static func xml(_ dataProvider:DataProvider) -> XML {
        return dataProvider.items.reduce("<items></items>".xml){
            let item = $1
            let child = "<item></item>".xml
            for attr:(key:String,value:String) in item{
                child[attr.key] = attr.value//add all attributes to the item
            }
            $0.appendChild(child)
            return $0
        }
    }
}
//getItemAtIndex
//childrenCount
