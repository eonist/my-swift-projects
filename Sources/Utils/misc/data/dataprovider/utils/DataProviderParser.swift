import Foundation

class DataProviderParser {
    /**
     * TODO: Use a real Range type here
     */
    static func itemsInRange(_ start:Int, _ end:Int,_ items:[[String:String]]) -> [[String:String]]{
        return items.slice2(start, end)
    }
    /**
     * TODO: Remove or use a more genereal approache?
     */
    static func itemByProperty(_ dataProvider:DataProvider,_ property:String) -> [String:String]?{
        return dataProvider.items.first(where: {$0["property"] == property})
    }
    /**
     * Returns an XML instance from PARAM: dataProvider
     * NOTE: the is the reverse algorithm as XMLParser.parseXMLToArray(xml)
     */
    static func xml(_ dataProvider:DataProvider) -> XML {
        return dataProvider.items.reduce("<items></items>".xml){
            let item = $1
            let child = "<item></item>".xml
            item.forEach{ key,value in//add all attributes to the item
                child[key] = value
            }
            $0.appendChild(child)
            return $0
        }
    }
}
//getItemAtIndex
//childrenCount
