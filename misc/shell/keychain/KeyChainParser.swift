import Security
import Foundation
//examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
class KeyChainParser {
	/**
	 * Returns a keychain item for key
     * EXAMPLE: KeyChainParser.load("eonist")!.stringValue//the password for this account
	 */	
    class func load(key: String) -> NSData? {
        let query = [kSecClass as String:kSecClassGenericPassword,kSecAttrAccount as String : key,kSecReturnData as String:kCFBooleanTrue, kSecMatchLimit as String:kSecMatchLimitOne ]
        //Swift.print("query: " + "\(query)")
        var dataTypeRef: AnyObject?
        let status = withUnsafeMutablePointer(&dataTypeRef) { SecItemCopyMatching(query, UnsafeMutablePointer($0)) }
        //Swift.print("status: " + "\(status)")
        if status == errSecSuccess {
            if let data = dataTypeRef as! NSData? {
                return data
            }
        }
        return nil
    }
}






