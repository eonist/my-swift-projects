import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}


/*
extension Dictionary where Key: String, Value:String{
    var xml:XML{
        return DictionaryParser.xml(self)
    }
}
 */
