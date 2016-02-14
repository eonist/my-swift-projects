import Foundation
/**
 * NOTE: we dont add items here, we get access to items from the DataProvider instance instead.
 */
class DataProviderEvent :Event{
    static var types:Array = [add,dataChange,remove,removeAll,replace,sort];
    static var add:String = "add";
    static var remove:String = "remove";
    static var removeAll:String = "removeAll";
    static var replace:String = "replace";
    static var sort:String = "sort";
    static var dataChange:String = "dataChange";
    init(_ type: String, startIndex:Int = -1, endIndex:Int = -1, _ origin: AnyObject) {
        self.startIndex = startIndex;
        self.endIndex = endIndex;
        super.init(type, origin)
    }
}