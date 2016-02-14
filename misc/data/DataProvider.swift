import Foundation
/*
 *
 * // :TODO: impliment allowDuplicates
 * // :TODO: replaceItem
 * // :TODO: merge() appends and removes duplicates
 * // :TODO: clone()
 * // :TODO: removeAll()
 * // :TODO: removeDuplicates
 * // :TODO: sortOn
 * // :TODO: outsource static pricate functions
 * // :TODO: Do we need a DataProviderItem?
 * // :TODO: create DataProviderItem that extends a proxy class so that it can hold virtual properties, shouuld have title and data as getters and setters
 *
 * @example
 * var orange:Object = {name:"orange", title:"harry"}
 * var blue:Object = {name:"blue", url:"na"}
 * var red:Object = {name:"red", headline:"spring"}
 * var dp:DataProvider = new DataProvider();
 * dp.addItem(orange);
 * dp.addItem(blue);
 * dp.addItem(red);
 * dp.removeItemAt(dp.getItemIndex(orange))
 * trace(dp.length())
 */
class DataProvider :EventSender{// :TODO: move methods intp parsers,modifiers asserters
    private var items:Array<AnyObject> = []//Array<AnyObject>()
    //private var allowDuplicates:Bool = true
    /**
     * Constructs the DataProvider class
     * @param object: Creates a new DataProvider object using a list, XML instance or an array of data objects as the data source.
     * // :TODO: Possibly add support for ...args see PointParser.sum function for similar functionality
     */
    init(object:AnyObject? = nil){
        if(object != nil && object is Array<AnyObject>) {items = object as! Array<AnyObject>}/*Array syntax: [{title:"orange", property:harry}, {title:"blue", property:"no"}]; //property is optional*/
        else if(object != nil /*&& object is XML*/) {/*items = XMLParser.parseXMLToArray(object)*/}
        else if(object != nil) {fatalError("DataProvider.constructor()<object> must be of type xml, or array")}
        super.init()
    }
    /**
     * Adds an array to the exisiting items array
     * @param items is an Array comprised of objects
     */
    func addItems(items:Array<AnyObject>) {
        self.items += items//concats
        super.onEvent(DataProviderEvent(DataProviderEvent.add, /*items,*/self.items.count - items.count, self.items.count,self))
    }
    /**
     * Adds an item to the Items Array
     * @param item is an Object instance as {title:"title"}
     */
    func addItem(item:AnyObject) {
        self.items.append(item)
        super.onEvent(DataProviderEvent(DataProviderEvent.add/*,[item]*/,self.items.count-1,self.items.count,self))
    }
    /**
     * Adds an item to a spesific index
     * @param item is an Object instance as {title:"title"}
     */
    func addItemAt(item:AnyObject, index:Int/*<--was UInt*/){
        ArrayModifier.addAt(&self.items, item, index)
        super.onEvent(DataProviderEvent(DataProviderEvent.add/*,[item]*/,index,index+1,self))
    }
    /**
     * Removes an item at a spesific index
     */
    func removeItemAt(index:Int)->AnyObject {
        var removedItem:AnyObject
        if (index <= self.items.count) {removedItem = self.items.splice(index,1)}
        else {(fatalError("\(self.dynamicType)" + " no item at the index of " + "\(index)"))}
        super.onEvent(DataProviderEvent(DataProviderEvent.remove, /*[removedItem],*/ index,index+1,self))
        return removedItem;
    }
    /**
     * Removes the item passed through the @param item
     */
    func removeItem(item:AnyObject)->AnyObject {
        let index:Int = self.items.indexOf(item)
        onEvent(DataProviderEvent(DataProviderEvent.remove, /*[item],*/ index,index+1,self))
        return self.items.splice (index,1)
    }
}
