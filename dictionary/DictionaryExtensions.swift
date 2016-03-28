import Foundation
/**
 * TODO: Try to make this extension Generic, currently its only working with String key value pairs
 */
extension Dictionary where Key: String, Value: String{
    func combine<K,V>(b:Dictionary<K,V>)->Dictionary<K,V>{
        return DictionaryModifier.combine(self, b)
    }
    //TODO: add merge aswell
}

