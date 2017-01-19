public class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    public static func describe<K,V>(_ dictionary:Dictionary<K,V>) where K:CustomStringConvertible{
        for (theKey,theValue) in dictionary{
            print("key: \(theKey) value: \(theValue)")
            //if(theValue is Dictionary) {describe(theValue)}
        }
    }
    /**
     *
     */
    public static func values(){
        //var valuesArray = [Double](toppings.values)
    }
    /**
     *
     */
    public static func keys(){
        //print(Array(theDict.keys))//convert the map collection view properties into an usable Array
    }
}
