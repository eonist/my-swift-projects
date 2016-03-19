import Foundation

class KeyChainUtils {
    
    /**
    *
    */
    class func dataValue(string:String)->NSData{
        return string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    }

    }
    
}
