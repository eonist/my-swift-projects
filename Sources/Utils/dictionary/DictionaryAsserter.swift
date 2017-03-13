import Foundation

class DictionaryAsserter {
    /**
     * Asserts if PARAM: dict has PARAM: key
     */
    static func hasKey<Key, Value>(_ dict:[Key: Value], _ key:Key) -> Bool{
        return dict[key] != nil
    }
}
