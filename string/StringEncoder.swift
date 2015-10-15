import Foundation

class StringUtils{
    /**
     * EXAMPLE: toNSData("String to encode")
     */
    class func encodeNSData(string:String)->NSData{
         return string.dataUsingEncoding(NSUTF8StringEncoding)
    }
}