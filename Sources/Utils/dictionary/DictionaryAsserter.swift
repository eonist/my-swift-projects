import Foundation

class DictionaryAsserter {
    /**
     * Asserts if PARAM: dict has PARAM: key*
     * NOTE: if value can be nil use: dictionary.index(forKey: "someKey") == nil, or use if let and assert if value is nil or not
     */
    static func hasKey<Key, Value>(_ dict:[Key: Value], _ key:Key) -> Bool{
        return dict[key] != nil
    }
    /**
     * TODO: ⚠️️ It's possible to add a bool flag to make it more precise. see legacy code for implimentation
     */
    static func contains<Key, Value>(_ dict:[Key: Value], _ keys:[Key]) -> Bool{
        for k in keys{
            return dict.hasKey(k)
        }
        return false
    }
    /**
     * Asserts if a variable is a Dictionary
     */
    static func isDict(dict:Any) -> Bool{
        return dict is AnyDict
    }
}
