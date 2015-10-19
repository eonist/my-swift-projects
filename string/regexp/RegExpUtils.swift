import Foundation

class RegExpUtils {
    /**
    *
    */
    class func value(str:String, _ result:NSTextCheckingResult, _ type:Any)->String{
        (str as NSString).substringWithRange(result.rangeAtIndex(type.rawValue))
        return ""
    }
}