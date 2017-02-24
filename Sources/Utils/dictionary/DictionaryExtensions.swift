import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}


extension CollectionType where Self: DictionaryLiteralConvertible, Self.Key == String, Self.Value == AnyObject, Generator.Element == (Self.Key, Self.Value) {
    var xml:XML{
        return DictionaryParser.xml(self)
    }
}
