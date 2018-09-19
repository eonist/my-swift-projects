import Foundation

extension UserDefaults {
    /**
     * Reads all key,val pairs in UserDefaults.standard
     */
    static func debugStandard(){
        UserDefaults.standard.dictionaryRepresentation().forEach { (key, value) in
            print("Key: \(key) value: \(value)")
        }
    }
}
