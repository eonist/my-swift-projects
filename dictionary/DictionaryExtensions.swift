import Foundation

protocol AnyDictionary{}//see ArrayExtensions for comentary
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}


/**
 * TODO: Try to make this extension Generic, currently its only working with String key value pairs
 */

/*

//this doesnt work, figure it out, something wrong with the generics

extension Dictionary where Key: String, Value: String{
    func combine(b:Dictionary<String,String>)->Dictionary<String,String>{
        return DictionaryModifier.combine(self, b)
    }
    //TODO: add merge aswell
}
*/