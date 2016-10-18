import Foundation
/**
 * // :TODO: Is dataprovider a candidat for struct? No, as it extends EventSender, unless you make an EventSender that is an extension, maybe with protocol and mixin?
 * // :TODO: add the method addItemsAs ?
 * // :TODO: impliment allowDuplicates
 * // :TODO: replaceItem
 * // :TODO: merge() appends and removes duplicates
 * // :TODO: clone()
 * // :TODO: removeAll()
 * // :TODO: removeDuplicates
 * // :TODO: sortOn
 * // :TODO: Do we need a DataProviderItem?
 * // :TODO: create DataProviderItem that extends a proxy class so that it can hold virtual properties, shouuld have title and data as getters and setters
 *
 * EXAMPLE:
 * let orange:Dictionary<String,String> = ["name":"orange", "title":"harry"]
 * let blue = ["name":"blue", "url":"na"]
 * let red = ["name":"red", "headline":"spring"]
 * dp.addItem(orange)
 * dp.addItem(blue)
 * dp.addItem(red)
 * dp.removeItemAt(dp.getItemIndex(orange))
 * Swift.print(dp.count())
 */
class DataProvider:EventSender{// :TODO: move methods intp parsers,modifiers asserters
    var items:[Dictionary<String, String>]//ideally it should be string,AnyObject//TODO:Maybe make this public getter private setter
    //private var allowDuplicates:Bool = true
    /**
     * Constructs the DataProvider class
     * @param object: Creates a new DataProvider object using a list, XML instance or an array of data objects as the data source.
     * // :TODO: Possibly add support for ...args see PointParser.sum function for similar functionality
     */
    init(_ items:[Dictionary<String, String>] = []){
        self.items = items/*Array syntax: [{title:"orange", property:harry}, {title:"blue", property:"no"}]; //property is optional*/
        super.init()
    }
}
/*parser*/
extension DataProvider{
    /**
     *
     */
    convenience init(_ xml:XML?){
        self.init(xml != nil ? XMLParser.toArray(xml!) : [])
    }
    /**
     *
     */
    func getItem(value:String, key:String = "title")->Dictionary<String, String>?{// :TODO: move this to DataProviderParser
        for item in self.items {
            if(item[key] == value) {return item}
        }
        Swift.print("\(self.dynamicType)" + " NO ITEM WITH THE " + "\(key)" + " OF: " + "\(value)")
        return nil
    }
    /**
     *
     */
    func index(key:String,_ value:String) -> Int?{
        let count = items.count
        for var i = 0; i < count; ++i{
            if(items[i][key] == value) {return i}
        }
        return nil
    }
    /**
     * Returns an item at a spessific index
     */
    func getItemAt(index:Int) -> Dictionary<String, String>? {
        if(index < self.items.count) {return self.items[index]}
        Swift.print("\(self)" + "no item at the index of " + "\(index)")
        return nil
    }
    /**
     * Returns the item index passed through the @param item
     */
    func getItemIndex(item:Dictionary<String, String>)->Int{// :TODO: rename to indexToItem?!?
        return self.items.indexOf{$0 == item} ?? -1
    }
    /**
     *
     */
    func getIndex(title:String)->Int?{
        let numOfItems = self.items.count
        for var i = 0; i < numOfItems; ++i{
            let item:Dictionary<String, String> = self.items[i]
            if(item["title"] == title) {return i}
        }
        return nil
    }
    /**
     * Returns the count of the self.items
     */
    var count:Int{return self.items.count}
}
/**
 * TODO: Implement support for xmlString as an init argument, is that needed? just do: string.xml
 */
//Modifier
extension DataProvider{
    
    /**
     * Adds an array to the exisiting items array
     * @param items is an Array comprised of objects
     */
    func addItems(items:[Dictionary<String, String>]) {
        self.items += items//concats
        super.onEvent(DataProviderEvent(DataProviderEvent.add, /*items,*/self.items.count - items.count, self.items.count,self))
    }
    /**
     * Adds an item to the end of the Items Array
     * @param item is an Object instance as {title:"title"}
     */
    func addItem(item:Dictionary<String, String>) {
        self.items.append(item)
        super.onEvent(DataProviderEvent(DataProviderEvent.add/*,[item]*/,self.items.count-1,self.items.count,self))
    }
    /**
     * Adds an item to a spesific index
     * @param item is an Object instance as {title:"title"}
     */
    func addItemAt(item:Dictionary<String, String>, _ index:Int/*<--was UInt*/){
        ArrayModifier.addAt(&self.items, item, index)
        super.onEvent(DataProviderEvent(DataProviderEvent.add/*,[item]*/,index,index+1,self))
    }
    /**
     * Removes an item at a spesific index
     */
    func removeItemAt(index:Int)->AnyObject {
        var removedItem:AnyObject
        if (index <= self.items.count) {removedItem = self.items.splice2(index,1)}
        else {(fatalError("\(self.dynamicType)" + " no item at the index of " + "\(index)"))}
        super.onEvent(DataProviderEvent(DataProviderEvent.remove, /*[removedItem],*/ index,index+1,self))
        return removedItem
    }
    /**
     * Removes the item passed through the @param item
     * RETURNS: the removed item
     */
    func removeItem(item:Dictionary<String, String>)->AnyObject {
        let index:Int = self.items.indexOf{$0 == item} ?? -1//-1 indicates no result found
        onEvent(DataProviderEvent(DataProviderEvent.remove, /*[item],*/ index,index+1,self))
        return self.items.splice2(index,1)
    }
    func removeAll(){
        //let tempItems = self.items// :TODO: is this necessary, maybe use some form of clone?
        let itemsCount = items.count
        self.items = []
        onEvent(DataProviderEvent(DataProviderEvent.removeAll, /*tempItems,*/ 0,itemsCount,self));
    }
    func sort(sortType:Int){
        fatalError("not implemented yet")
        //self.items.sortOn("title", sortType);
        //onEvent(DataProviderEvent(DataProviderEvent.sort/*, [self.items]*/, 0,self.items.count,self));
    }
    /**
     *
     */
    func sortOn(names:AnyObject, _ options:Int = 0,_ args:AnyObject...){
        fatalError("not implemented yet")
        //self.items.sortOn(names, options,args);
        //onEvent(DataProviderEvent(DataProviderEvent.sort, /*[_items],*/ 0,self.items.count,self));
    }
    /**
     *
     */
    func setValue(index:Int,_ key:String, _ value:String){
        self.items[index][key] = value
    }
}