import Foundation
/**
 * NOTE: We don't add items here, we get access to items from the DataProvider instance instead
 */
class DataProviderEvent:Event{
    static var add:String = "add"
    static var remove:String = "remove"
    static var removeAll:String = "removeAll"
    static var replace:String = "replace"
    static var sort:String = "sort"
    static var dataChange:String = "dataChange"
    static var types:[String] = [add,dataChange,remove,removeAll,replace,sort]
    var startIndex:Int
    var endIndex:Int
    init(_ type: String, _ startIndex:Int = -1, _ endIndex:Int = -1, _ origin:AnyObject) {
        self.startIndex = startIndex
        self.endIndex = endIndex
        super.init(type, origin)
    }
}
extension DataProviderEvent{
    /**
     * Convenience
     * NOTE: Keeps the event light-weight by not referencing the item directly
     */
    var items:[[String:String]]{
        Swift.print("startIndex: " + "\(startIndex)")
        Swift.print("endIndex: " + "\(endIndex)")
        Swift.print("items.count: \((origin as! DataProvider).items.count)" )
        return DataProviderParser.itemsInRange(startIndex,  endIndex, (origin as! DataProvider).items)
    }
    var item:[String:String]{return (origin as! DataProvider).items[startIndex]}//new
    var count:Int {return endIndex - startIndex}
}
