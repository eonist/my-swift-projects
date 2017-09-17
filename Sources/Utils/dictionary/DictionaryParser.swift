/**
 * TODO: ⚠️️ Rename to DictParser? or make a typalias at least?
 */
class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    static func describe<K,V>(_ dictionary:[K:V]) where K:CustomStringConvertible{
        dictionary.forEach{ k,v in
            print("key: \(k) value: \(v)")
            //if(theValue is Dictionary) {describe(theValue)}
        }
    }
    /**
     * New
     */
    static func xml(_ dict:[String:String],_ nodeName:String = "item") -> XML{
        let xml:XML = "<\(nodeName)></\(nodeName)>".xml
        xml.setAttributesWith(dict)
        return xml
    }
    /**
     * Rturns tuples from PARAM: dict
     * NOTE: is generic
     * EXAMPLE: pairs([1: "Swift", 2: "Generics", 3: "Rule"])//[(2, "Generics"), (3, "Rule"), (1, "Swift")]
     * NOTE: You can also do the reverse with .reduce see the reduce.md file about dict reduce
     */
    static func pairs<Key, Value>(_ dict: [Key: Value]) -> [(Key, Value)] {
        return Array(dict)
    }
    /**
     * New
     * EXAMPLE: ["b":2,"a":1,"c":3].sortedByValue//a:1, b:2, c:3
     */
    static func sortByValue<Key, Value:Comparable>(_ dict: [Key: Value]) -> [(Key, Value)]{
        return Array(dict).sorted{$0.1 < $1.1}
    }
    /**
     * New
     * EXAMPLE: ["b":2,"a":1,"c":3].sortedByKey//a:1, b:2, c:3
     */
    static func sortByKey<Key:Comparable, Value>(_ dict: [Key: Value]) -> [(Key, Value)]{
        return Array(dict).sorted{$0.0 < $1.0}
    }
    /**
     * Converts tuples to dict
     */
    static func dict<K,V>(tuples:[(K,V)])->[K:V]{
        return tuples.reduce([:]) {
            var dict:[K:V] = $0
            dict[$1.0] = $1.1
            return dict
        }
    }
}
