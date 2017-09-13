import Foundation
typealias DP2 = DataProvider2
/**
 * This is not in use yet. But will take over for DP v1 soon
 * NOTE: we dont use struct because var's cant be mutating. we could use method getter and stter but it would clutter up the class, also DataProviers are not mean tto be copied, and usually only exist once at the time
 */
class DataProvider2<T>:EventSender,DataProvidable2 {//⚠️️ maybe use U,T
    typealias argType = T
    var items:[T]
    /**
     * NOTE: This method is not in an extension because its meant to be overridable
     */
    var count:Int{return self.items.count}
    init(items:[T]){
        self.items = items
    }
    /**
     * Returns an item at a spessific index
     * NOTE: This method is not in an extension because its meant to be overridable
     */
    func item(at:Int) -> T?{
        return self.items[safe:at]
    }
}
extension DataProvider2 {
    /**
     * Creates a DataProvider instance from an XML instance
     */
    convenience init(xml:XML?){
        let val:[T] = xml != nil ? XMLParser.toArray(xml!) as! [T]  : []
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
