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
