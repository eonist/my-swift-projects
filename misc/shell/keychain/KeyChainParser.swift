import Security
import Foundation
//examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
class KeyChainParser {
    /**
     *
     * Returns a record with account name and password by querrying keychain with the "keychain item name" of the password-keychain-item
     * Note: the_keychain_item_name is the "name" of the keychain-password-item
     * Caution: Make sure your keychain item is unique, or else it may return the wrong keychain, this includes secure notes
     * Note: appending find-generic-password -a  & account_name &  -g will retrive keychain itm name and pass from account name
     * Example: keychain_data("flowerpower2")--{keychain_item_name:"flowerpower2", account_name:"John", the_password:"HereIsJohnny2015"}
     * Note: to access a record use the_password of keychain_data
     * Todo: impliment support for retriving the comment in the keychain item
     * Caution: If there are unusual characters in the password, it isn't output as plain text, it's output encoded in hex. Here's a python script I've been using which covers that case: http://blog.macromates.com/2006/keychain-access-from-shell/
     * Caution: If the password contains special chars, the password will be returned as hex values, Use ShellUtil's hex_to_ascii(hex_text
     */
    class func keychainData(keychainItemName:String)->Dictionary<String,String>{
        let keyChainData:Dictionary<String,String> = ["accountName":"eonist","accountPassword":"12345"]
        return keyChainData
    }
    
	/**
	 * Returns a keychain item for key
	 */	
    class func load(key: String) -> NSData? {
        let query = [kSecClass as String:kSecClassGenericPassword,kSecAttrAccount as String : key,kSecReturnData as String  : kCFBooleanTrue,kSecMatchLimit as String  : kSecMatchLimitOne ]
        var dataTypeRef: AnyObject?
        let status = withUnsafeMutablePointer(&dataTypeRef) { SecItemCopyMatching(query, UnsafeMutablePointer($0)) }
        if status == errSecSuccess {
            if let data = dataTypeRef as! NSData? {
                return data
            }
        }
        return nil
    }
    
}






