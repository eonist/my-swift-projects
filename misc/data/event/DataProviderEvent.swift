import Foundation
/**
 * NOTE: we dont add items here, we get access to items from the DataProvider instance instead.
 */
class DataProviderEvent :Event{
    
    public static const TYPES:Array = [ADD,DATA_CHANGE,REMOVE,REMOVE_ALL,REPLACE,SORT];
    public static const ADD:String = "add";
    public static const REMOVE:String = "remove";
    public static const REMOVE_ALL:String = "removeAll";
    public static const REPLACE:String = "replace";
    public static const SORT:String = "sort";
    public static const DATA_CHANGE:String = "dataChange";
    
    
    init(_ type: String, startIndex:Int = -1, endIndex:Int = -1, _ origin: AnyObject) {
        super.init(type, origin)
    }
}
