import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}


extension Dictionary {
    var xml:XML{
        return DictionaryParser.xml(self as! Dictionary<String, String>)
    }
}
