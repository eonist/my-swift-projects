import Foundation

class KeyChainModifier {
    /**
     * Save keychain data for key
     * EXAMPLE: KeyChainModifier.save("Antilion", "abc123".dataValue)
     */
    static func save(_ key: String, _ data:Data, _ secClass:CFString = kSecClassGenericPassword) -> Bool {
        let query = [
            kSecClass as String : secClass,
            kSecAttrAccount as String : key,
            kSecValueData as String : data ]  as CFDictionary
        SecItemDelete(query)
        let status:OSStatus = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }
    /**
     * Deletes a keychain item for key
     */
    static func delete(_ key:String, _ secClass:CFString = kSecClassGenericPassword) -> Bool {
        let query:CFDictionary = [
            kSecClass as String : secClass,
            kSecAttrAccount as String : key ] as CFDictionary
        let status:OSStatus = SecItemDelete(query)
        return status == noErr
    }
    /**
     * What does this method do? research needed
     * EXAMPLE: Keychain.clear()
     */
    static func clear( _ secClass:CFString = kSecClassGenericPassword) -> Bool {
        let query:CFDictionary = [ kSecClass as String : secClass ] as CFDictionary
        let status:OSStatus = SecItemDelete(query)
        return status == noErr
    }
}
