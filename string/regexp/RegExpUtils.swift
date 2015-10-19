import Foundation

class RegExpUtils {
    /**
    *
    */
    class func value(str:String, _ result:NSTextCheckingResult, _ key:Int)->String{
        
        return (str as NSString).substringWithRange(result.rangeAtIndex(key))
        
    }
}