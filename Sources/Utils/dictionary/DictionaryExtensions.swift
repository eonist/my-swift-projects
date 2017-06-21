import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}
protocol AnyDict{}
extension Dictionary:AnyDict{}

extension AnyDict {
    var xml:XML{
        return DictionaryParser.xml(self as! [String:String])
    }
}
/**
 * ⚠️️ Untested
 * Basically just returns a sorted array for the values in a dict
 */
extension Dictionary where Value:Comparable {
    var valuesOrdered:[Value] {
        return self.values.sorted()
    }
    var sortedByValue:[(Key,Value)] {return DictionaryParser.sortByValue(self)}
}
/**
 * ⚠️️ Untested
 * ["two":"monkey","one":"cat","three":"hamster"].keysOrdered  // ["one", "three", "two"]
 */
extension Dictionary where Key:Comparable {
    var keysOrdered:[Key] {return self.keys.sorted()}
    var sortedByKey:[(Key,Value)] {return DictionaryParser.sortByKey(self)}
}
extension Dictionary {
    func hasKey( _ key:Key) -> Bool{/*Convenience*/
        return DictionaryAsserter.hasKey(self, key)
    }
    func contains(_ keys:[Key]) -> Bool{/*Convenience*/
        return DictionaryAsserter.contains(self, keys)
    }
}

