import Security
import Foundation
/**
 * Examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
 */
class KeyChainParser {
    /**
     *
     */
    static func password(_ accountName:String)->String{
       return load(accountName)!.stringValue
    }
	/**
	 * Returns a keychain item for key
     * EXAMPLE: KeyChainParser.load("eonist")!.stringValue//loads the password for this account
	 */	
    static func load(_ key:String) -> Data? {
        let query:CFDictionary = [kSecClass as String:kSecClassGenericPassword,kSecAttrAccount as String : key,kSecReturnData as String:kCFBooleanTrue, kSecMatchLimit as String:kSecMatchLimitOne ] as CFDictionary
        //Swift.print("query: " + "\(query)")
        var dataTypeRef:AnyObject?
        let status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query, UnsafeMutablePointer($0)) }
        //Swift.print("status: " + "\(status)")
        if status == errSecSuccess {
            if let data = dataTypeRef as! Data? {
                return data
            }
        }
        return nil
    }
}
class KeyChainUtils {
    /**
     *
     */
    static func dataValue(_ string:String)->Data{
        return string.data(using: .utf8, allowLossyConversion: false)!
        //return string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    }
    /**
     *
     */
    static func stringValue(_ data:Data)->String{
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String
    }
}
extension String {
    public var dataValue: Data {
        return KeyChainUtils.dataValue(self)
    }
}
extension Data {
    public var stringValue: String {
        return KeyChainUtils.stringValue(self)
    }
}
