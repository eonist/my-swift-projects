import Foundation
/**
 * NOTE: we dont add items here, we get access to items from the DataProvider instance instead.
 */
class DataProviderEvent :Event{
    
    
    //continue here: add types
    
    
    init(_ type: String, startIndex:Int = -1, endIndex:Int = -1, _ origin: AnyObject) {
        super.init(type, origin)
    }
}
