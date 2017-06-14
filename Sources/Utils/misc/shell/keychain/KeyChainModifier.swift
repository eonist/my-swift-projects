import Foundation

class KeyChainModifier {
    /**
     * Save keychain data for key
     * TODO: move to KeyChainModifier.swift
     */
    static func save(_ key: String, _ data:NSData) -> Bool {
        let query = [kSecClass as String : kSecClassGenericPassword as String, kSecAttrAccount as String : key,  kSecValueData as String   : data ]  as CFDictionary
        SecItemDelete(query)
        let status:OSStatus = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }
    /**
     * Deletes a keychain item for key
     */
    static func delete(_ key:String) -> Bool {
        let query:CFDictionary = [ kSecClass as String : kSecClassGenericPassword,kSecAttrAccount as String : key ] as CFDictionary
        let status:OSStatus = SecItemDelete(query)
        return status == noErr
    }
    /**
     * What does this method do? research needed
     * TODO: move to KeyChainModifier.swift
     * EXAMPLE: Keychain.clear()
     */
    static func clear() -> Bool {
        let query:CFDictionary = [ kSecClass as String : kSecClassGenericPassword ] as CFDictionary
        let status:OSStatus = SecItemDelete(query)
        return status == noErr
    }
}
