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
 * // :TODO: Is dataprovider a candidat for struct? No, as it extends EventSender, unless you make an EventSender that is an extension, maybe with protocol and mixin? 👈 yes
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
 * TODO: ⚠️️ Maybe make it a struct, and use generics?
 */
typealias DP = DataProvider
/**
 * COnvert to struct, EventSender can be implemented as protocol and extension and var etc
 */
class DataProvider:EventSender,DataProvidable{// :TODO: ⚠️️ move methods into parsers,modifiers asserters
    var items:[[String:String]]//ideally it should be string,AnyObject//TODO: ⚠️️ Maybe make this public getter private setter
    var count:Int{return self.items.count}
    //private var allowDuplicates:Bool = true
    /**
     * Constructs the DataProvider class
     * PARAM: object: Creates a new DataProvider object using a list, XML instance or an array of data objects as the data source.
     * EXAMPLE: Array syntax: [{title:"orange", property:harry}, {title:"blue", property:"no"}]; //property is optional
     * TODO: ⚠️️ Possibly add support for ...args see PointParser.sum function for similar functionality
     */
    init(_ items:[[String:String]] = []){
        self.items = items
        super.init()
    }
    /**
     * Returns an item at a spessific index
     * NOTE: This method is not in an extension because its meant to be overridable
     */
    func item(_ at:Int) -> [String:String]?{
        return self.items[safe:at]
    }
    /**
     * Creates a DataProvider instance from an XML instance
     */
    convenience init(_ xml:XML?){
        self.init(xml != nil ? XMLParser.toArray(xml!) : [])
    }
    /**
     * Creates a DP from an file url string
     * IMPORTANT: ⚠️️ Remember to "tildeExpand" the fileURLStr before you pass it to the method
     */
    convenience init(_ fileURLStr:String){
        let xml = FileParser.xml(fileURLStr)
        self.init(XMLParser.toArray(xml))
    }
}
