import Foundation
/**
 * NOTE: we dont add items here, we get access to items from the DataProvider instance instead.
 */
class DataProviderEvent :Event{
    static var add:String = "add";
    static var remove:String = "remove";
    static var removeAll:String = "removeAll";
    static var replace:String = "replace";
    static var sort:String = "sort";
    static var dataChange:String = "dataChange";
    static var types:Array<String> = [add,dataChange,remove,removeAll,replace,sort]
    var startIndex:Int;
    var endIndex:Int;
    init(_ type: String, _ startIndex:Int = -1, _ endIndex:Int = -1, _ origin: AnyObject) {
        self.startIndex = startIndex;
        self.endIndex = endIndex;
        super.init(type, origin)
    }
}
extension DataProviderEvent{
    
}