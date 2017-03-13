import Foundation

class DictionaryAsserter {
    /**
     * Asserts if PARAM: dict has PARAM: key
     */
    static func hasKey<Key, Value>(_ dict:[Key: Value], _ key:Key) -> Bool{
        return dict[key] != nil
    }
    static func contains<Key, Value>(_ dict:[Key: Value], _ keys:[Key]) -> Bool{
        for k in keys{
            return dict.hasKey(k)
        }
        
        dict.
        //return dict[key] != nil
    }
}
