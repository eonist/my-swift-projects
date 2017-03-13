import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}
protocol AnyDict{}
extension Dictionary:AnyDict{}

extension AnyDict {
    var xml:XML{
        return DictionaryParser.xml(self as! Dictionary<String, String>)
    }
}
/**
 * ⚠️️ Untested
 */
extension Dictionary where Value:Comparable {
    var valuesOrdered:[Value] {
        return self.values.sorted()
    }
}

/**
 * ⚠️️ Untested
 * ["two":"monkey","one":"cat","three":"hamster"].keysOrdered  // ["one", "three", "two"]
 */
extension Dictionary where Key:Comparable {
    var keysOrdered:[Key] {
        return self.keys.sorted()
    }
    
}

extension Dictionary where Key == String{
    func hasKey<Key, Value>( _ key:Key) -> Bool{
        return self[key] != nil
    }
}
