import Foundation

class KeyChainModifier {
    /**
     * Save keychain data for key
     * TODO: move to KeyChainModifier.swift
     */
    static func save(key: String, _ data: NSData) -> Bool {
        let query = [kSecClass as String : kSecClassGenericPassword as String, kSecAttrAccount as String : key,  kSecValueData as String   : data ]
        SecItemDelete(query as CFDictionaryRef)
        let status: OSStatus = SecItemAdd(query as CFDictionaryRef, nil)
        return status == noErr
    }
    /**
     * Deletes a keychain item for key
     */
    static func delete(key: String) -> Bool {
        let query = [ kSecClass as String : kSecClassGenericPassword,kSecAttrAccount as String : key ]
        let status: OSStatus = SecItemDelete(query as CFDictionaryRef)
        return status == noErr
    }
    /**
     * What does this method do? research needed
     * TODO: move to KeyChainModifier.swift
     * EXAMPLE: Keychain.clear()
     */
    static func clear() -> Bool {
        let query = [ kSecClass as String : kSecClassGenericPassword ]
        let status: OSStatus = SecItemDelete(query as CFDictionaryRef)
        return status == noErr
    }
}