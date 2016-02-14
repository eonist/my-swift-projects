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
}