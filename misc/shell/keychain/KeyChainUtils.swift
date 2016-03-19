import Foundation

class KeyChainUtils {
    
    /**
     *
     */
    class func dataValue(string:String)->NSData{
        return string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    }
    /**
     *
     */
    class func stringValue(data:NSData)->String{
        return NSString(data: data, encoding: NSUTF8StringEncoding)!
    }
}
