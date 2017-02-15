import Foundation
/**
 * DataProvider is a class that stores information in a list. Basically an aray that has dictionaries. (DataProvider was inspired by .Net etc)
 * NOTE: DataProvider has usefull methods for adding/removing and sorting a list
 * NOTE: DataProvider sends Events when it changes so that a GUI presenter class can be updated accordingly
 * NOTE: there is also the Node.swift class that can organize tables of data rather than just a list
 * EXAMPLE:
 * let orange:Dictionary<String,String> = ["name":"orange", "title":"harry"]
 * let blue = ["name":"blue", "url":"na"]
 * let red = ["name":"red", "headline":"spring"]
 * dp.addItem(orange)
 * dp.addItem(blue)
 * dp.addItem(red)
 * dp.removeItemAt(dp.getItemIndex(orange))
 * Swift.print(dp.count())
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
 */
class DataProvider:EventSender{// :TODO: move methods into parsers,modifiers asserters
    var items:[Dictionary<String, String>]//ideally it should be string,AnyObject//TODO:Maybe make this public getter private setter
    //private var allowDuplicates:Bool = true
    /**
     * Constructs the DataProvider class
     * PARAM: object: Creates a new DataProvider object using a list, XML instance or an array of data objects as the data source.
     * EXAMPLE: Array syntax: [{title:"orange", property:harry}, {title:"blue", property:"no"}]; //property is optional
     * TODO: Possibly add support for ...args see PointParser.sum function for similar functionality
     */
    init(_ items:[Dictionary<String, String>] = []){
        self.items = items
        super.init()
    }
}
/*Parser*/
extension DataProvider{
    var count:Int{return self.items.count}/*convenience*/
    var xml:XML {return DataProviderParser.xml(self)}/*convenience*/
    /**
     * Creates a DataProvider instance from an XML instance
     */
    convenience init(_ xml:XML?){
        self.init(xml != nil ? XMLParser.toArray(xml!) : [])
    }
    /**
     * Creates a DP from an file url string 
     * IMPORTANT: Remember to "tildeExpand" the fileURLStr before you pass it to the method
     */
    convenience init(_ fileURLStr:String){
        let xml = FileParser.xml(fileURLStr)
        self.init(XMLParser.toArray(xml))
    }
    /**
     * Returns the first item that has the PARAM: value at PARAM key
     */
    func getItem(_ value:String, key:String = "title")->Dictionary<String, String>?{// :TODO: move this to DataProviderParser
        for item in self.items {
            if(item[key] == value) {return item}
        }
        Swift.print("\(ClassParser.type(self))" + " NO ITEM WITH THE " + "\(key)" + " OF: " + "\(value)")
        return nil
    }
    /**
     * Returns the index of the first item that has the PARAM: value at PARAM: key
     */
    func index(_ key:String,_ value:String) -> Int?{
        let count = items.count
        for i in 0..<count{
            if(items[i][key] == value) {return i}
        }
        return nil
    }
    /**
     * Returns an item at a spessific index
     */
    func getItemAt(_ index:Int) -> Dictionary<String, String>? {
        if(index < self.items.count) {return self.items[index]}
        Swift.print("\(self)" + "no item at the index of " + "\(index)")
        return nil
    }
    /**
     * Returns the item index passed through the PARAM item
     */
    func getItemIndex(_ item:Dictionary<String, String>)->Int{// :TODO: rename to indexToItem?!?
        return self.items.index{$0 == item} ?? -1//upgraded to swift 3 syntax
    }
    /**
     *
     */
    func getIndex(_ title:String)->Int?{
        let count = self.items.count
        for i in 0..<count{
            let item:Dictionary<String, String> = self.items[i]
            if(item["title"] == title) {return i}
        }
        return nil
    }
    /**
     * Returns the count of the self.items
     */
    func getValue(_ index:Int,_ key:String)->String?{
        if let value = self.items[index][key]{
            return value
        }
        return nil
    }
}
/**
 * TODO: Implement support for xmlString as an init argument, is that needed? just do: string.xml
 */
//Modifier
extension DataProvider{
    /**
     * Adds an array to the exisiting items array
     * PARAM: items is an Array comprised of objects
     */
    func addItems(_ items:[Dictionary<String, String>]) {
        self.items += items//concats
        super.onEvent(DataProviderEvent(DataProviderEvent.add, self.items.count - items.count, self.items.count,self))
    }
    /**
     * Adds an item to the end of the Items Array
     * PARAM: item is an Object instance as {title:"title"}
     */
    func addItem(_ item:Dictionary<String, String>) {
        self.items.append(item)
        super.onEvent(DataProviderEvent(DataProviderEvent.add,self.items.count-1,self.items.count,self))
    }
    /**
     * Adds an item to a spesific index
     * PARAM: item is an Object instance as {title:"title"}
     */
    func addItemAt(_ item:Dictionary<String, String>, _ index:Int){
        Swift.print("DataProvider.addItemAt()")
        ArrayModifier.addAt(&self.items, item, index)
        super.onEvent(DataProviderEvent(DataProviderEvent.add,index,index+1,self))
    }
    /**
     * Removes an item at a spesific index
     */
    func removeItemAt(_ index:Int)->[String:String] {
        Swift.print("removeItemAt.index: " + "\(index)")
        var removedItem:[String:String]
        if (index < self.items.count) {
            Swift.print("removed at: " + "\(index)")
            removedItem = items[index]
            self.items.removeAt(index)
        }else {(fatalError("\(ClassParser.type(self))" + " no item at the index of " + "\(index)"))}
        let start:Int = index == 0 ? 0 : index - 1
        let end:Int = index
        super.onEvent(DataProviderEvent(DataProviderEvent.remove, start,end,self))
        return removedItem
    }
    /**
     * Removes the item passed through the @param item
     * RETURNS: the removed item
     */
    func removeItem(_ item:Dictionary<String, String>)->[String:String] {
        let index:Int = self.items.index{$0 == item} ?? -1//-1 indicates no result found
        onEvent(DataProviderEvent(DataProviderEvent.remove, /*[item],*/ index,index+1,self))
        return self.items.splice2(index,1)[0]
    }
    func removeAll(){
        //let tempItems = self.items// :TODO: is this necessary, maybe use some form of clone?
        let itemsCount = items.count
        self.items = []
        onEvent(DataProviderEvent(DataProviderEvent.removeAll, /*tempItems,*/ 0,itemsCount,self));
    }
    func sort(_ sortType:Int){
        fatalError("not implemented yet")
        //self.items.sortOn("title", sortType);
        //onEvent(DataProviderEvent(DataProviderEvent.sort/*, [self.items]*/, 0,self.items.count,self));
    }
    /**
     * Sorts items by the key provided in ascending or descending order
     * EXAMPLE: DataProvider([["date":"0214","title":"a"],["date":"0216","title":"b"],["date":"0114","title":"c"]]).sort("date").items.forEach{Swift.print($0["title"])}//c,a,b
     */
    func sort(_ key:String,_ ascending:Bool = true)->DataProvider{/*names:AnyObject, _ options:Int = 0,_ args:AnyObject...*/
        self.items.sort { (a, b) -> Bool in
            return ascending ? a[key]! < b[key]! : a[key]! > b[key]!//Toggles ascending and descending
        }//self.items.sortOn(names, options,args);
        onEvent(DataProviderEvent(DataProviderEvent.sort, /*[_items],*/ 0,self.items.count,self))
        return self/*For chaining purpouse*/
    }
    /**
     * Update data in dataProvider item at PARAM index
     */
    func setValue(_ index:Int,_ key:String, _ value:String){
        if(index < self.items.count){/*Make sure index is within range*/
            self.items[index][key] = value
            super.onEvent(DataProviderEvent(DataProviderEvent.dataChange/*,[item]*/,index,index,self))//<-new
        }
    }
    /**
     * Sets all values except at PARAM: exceptionIndex
     */
    func setValuesExceptAt(_ exceptionIndex:Int, _ key:String, _ value:String) {
        for i in 0..<self.items.count{
            if(i != exceptionIndex){self.items[exceptionIndex][key] = value}
        }
    }
}
