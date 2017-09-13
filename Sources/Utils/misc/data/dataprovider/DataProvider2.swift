import Foundation
typealias DP2 = DataProvider2
/**
 * This is not in use yet. But will take over for DP v1 soon
 */
class DataProvider2<T>:EventSender,DataProvidable2 {
    typealias argType = T
    var items:[DPType]
    init(items:[DPType]){
        self.items = items
    }
}
extension DataProvider2 {
    var count:Int{return self.items.count}
    /**
     * Returns an item at a spessific index
     */
    func item(at:Int) -> [String:T]?{
        return self.items[safe:at]
    }
    /**
     * Creates a DataProvider instance from an XML instance
     */
    convenience init(xml:XML?){
        let val:[DPType] = xml != nil ? XMLParser.toArray(xml!) as! [DPType]  : []
        self.init(items:val)
    }
    /**
     * Creates a DP from an file url string
     * IMPORTANT: ⚠️️ Remember to "tildeExpand" the fileURLStr before you pass it to the method
     */
    convenience init(_ fileURLStr:String){
        let xml = FileParser.xml(fileURLStr)
        self.init(xml:xml)
    }
}
