import Foundation
class DataProviderModifier {
    /**
     * Adds an item to @param dataProvider at an array index @param index
     */
    static func addItemAtIndex(dataProvider:DataProvider,_ index:Array<Int>,_ item:Dictionary<String,String>)->DataProvider{
        //see legacy code for instructions on how to inplement this
        return DataProvider()
    }
    /**
     *
     */
    class func select(dataProvider:DataProvider, _ index:Int, _ isSelected:Bool){
        let item = dataProvider.getItemAt(index)
        item["selected"] = isSelected
    }
}