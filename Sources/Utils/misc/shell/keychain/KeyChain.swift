import Foundation

class KeyChain {
    /**
     * Returns password for PARAM: accountName
     * EXAMPLE: KeyChainParser.password("eonist")//123abc
     * NOTE: this methods exists because of: convenience and clearity of code
     */
    static func password(_ accountName:String)->String?{
        return KeyChainParser.load(accountName)?.stringValue
    }
}
