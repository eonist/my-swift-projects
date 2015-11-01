import Foundation

class RegExpUtils {
    /**
     * helper method for extracting associate capture groups
     * TODO: Would be great if .rawValue was done inside this method and write an example
     */
    class func value(str:String, _ result:NSTextCheckingResult, _ key:Int)->String{
        return (str as NSString).substringWithRange(result.rangeAtIndex(key))
    }
}