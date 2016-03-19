import Security
import Foundation
//examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
class KeyChainParser {
    /**
	  * Save keychain data for key
	  * TODO: move to KeyChainModifier.swift
	  */
    class func save(key: String, _ data: NSData) -> Bool {
        let query = [kSecClass as String       : kSecClassGenericPassword as String, kSecAttrAccount as String : key,  kSecValueData as String   : data ]
        SecItemDelete(query as CFDictionaryRef)
        let status: OSStatus = SecItemAdd(query as CFDictionaryRef, nil)
        return status == noErr
    }
	/**
	 * Returns a keychain item for key
	 */	
    class func load(key: String) -> NSData? {
        /**/
        let query = [kSecClass as String : kSecClassGenericPassword,kSecAttrAccount as String : key, kSecReturnData as String  : kCFBooleanTrue,kSecMatchLimit as String  : kSecMatchLimitOne ]
        let dataTypeRef:UnsafeMutablePointer<AnyObject?>?
        let status: OSStatus = SecItemCopyMatching(query, dataTypeRef!)
        if status == noErr {
            return (dataTypeRef! as! NSData)
        } else {
            return nil
        }

        fatalError("NOT IMPLEMENTED YET")
    }
	/**
	 * Deletes a keychain item for key
	 * TODO: move to KeyChainModifier.swift
	 */
    class func delete(key: String) -> Bool {
        let query = [ kSecClass as String : kSecClassGenericPassword,kSecAttrAccount as String : key ]
        let status: OSStatus = SecItemDelete(query as CFDictionaryRef)
        return status == noErr
    }
    /**
	  * what does this method do? research needed
	  * TODO: move to KeyChainModifier.swift
	  */
    class func clear() -> Bool {
        let query = [ kSecClass as String : kSecClassGenericPassword ]
        let status: OSStatus = SecItemDelete(query as CFDictionaryRef)
        return status == noErr
    }
}






