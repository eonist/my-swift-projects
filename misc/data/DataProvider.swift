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
    init(object:AnyObject? = nil){
        if(object != nil && object is Array<AnyObject>) {items = object as! Array<AnyObject>}/*Array syntax: [{title:"orange", property:harry}, {title:"blue", property:"no"}]; //property is optional*/
        else if(object != nil /*&& object is XML*/) {/*items = XMLParser.parseXMLToArray(object)*/}
        else if(object != nil) {fatalError("DataProvider.constructor()<object> must be of type xml, or array")}
        super.init()
    }
}
