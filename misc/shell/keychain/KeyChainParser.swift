import Security
import Foundation
//examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
class KeyChainParser {
    /**
     *
     */
    static func password(accountName:String)->String{
       return load(accountName)!.stringValue
    }
	/**
	 * Returns a keychain item for key
     * EXAMPLE: KeyChainParser.load("eonist")!.stringValue//loads the password for this account
	 */	
    static func load(key: String) -> NSData? {
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
class KeyChainUtils {
    /**
     *
     */
    static func dataValue(string:String)->NSData{
        return string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    }
    /**
     *
     */
    static func stringValue(data:NSData)->String{
        return NSString(data: data, encoding: NSUTF8StringEncoding) as! String
    }
}
extension String {
    public var dataValue: NSData {return KeyChainUtils.dataValue(self)}
}
extension NSData {
    public var stringValue: String {return KeyChainUtils.stringValue(self)}
}