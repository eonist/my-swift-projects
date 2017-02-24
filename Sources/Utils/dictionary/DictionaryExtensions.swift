import Foundation

protocol AnyDictionary{}//see ArrayExtensions for description
extension Dictionary:AnyDictionary{}
extension NSDictionary:AnyDictionary{}


extension AnyDictionary {
    var xml:XML{
        return DictionaryParser.xml(self as! Dictionary<String, String>)
    }
}

extension Dictionary where Key : ExpressibleByStringLiteral, Value : AnyObject {
    
    var movieName : String {
        if let nameObj = self["im:name"] as? [String:AnyObject] {
            return nameObj["label"] as! String
        }
        return ""
    }
}
