class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    static func describe<K,V>(_ dictionary:[K:V]) where K:CustomStringConvertible{
        for (theKey,theValue) in dictionary{
            print("key: \(theKey) value: \(theValue)")
            //if(theValue is Dictionary) {describe(theValue)}
        }
    }
    /**
     * New
     */
    static func xml(_ dict:[String:String],_ nodeName:String = "item")->XML{
        let xml:XML = "<\(nodeName)></\(nodeName)>".xml
        xml.setAttributesWith(dict)
        return xml
    }
    /**
     * Rturns tuples from PARAM: dict
     * NOTE: is generic
     * EXAMPLE: pairs([1: "Swift", 2: "Generics", 3: "Rule"])//[(2, "Generics"), (3, "Rule"), (1, "Swift")]
     */
    static func pairs<Key, Value>(_ dict: [Key: Value]) -> [(Key, Value)] {
        return Array(dict)
    }
    /**
     * Stores indecies as keys 
     * ⚠️️ IMPORTANT: keys must be uniqe (Assert uniqness of array before use)
     * ["a","b","c"].hash//[["a":0],["b":1],["c":2]]
     */
    static func hash(_ arr:[String]){
        
        var dict:[String:Int] = [:]
        for (i,key) in arr.enumerated(){
            dict[key] = i
        }
    }
}
