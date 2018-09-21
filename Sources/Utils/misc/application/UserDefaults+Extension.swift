import Foundation

extension UserDefaults {
    /**
     * Reads all (key,val) pairs in UserDefaults.standard
     */
    static func debug(){
        UserDefaults.standard.dictionaryRepresentation().forEach { (key, value) in
            print("Key: \(key) value: \(value)")
        }
    }
    /**
     * Removes all keys and values from user defaults
     */
    static func removeAll() {
        UserDefaults.standard.dictionaryRepresentation().forEach{  (key, _) in
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
