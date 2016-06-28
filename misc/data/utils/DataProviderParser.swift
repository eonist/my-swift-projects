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
    //xml
    //childrenCount
}