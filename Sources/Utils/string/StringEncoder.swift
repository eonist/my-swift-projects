import Foundation

class StringEncoder{
    /**
     * EXAMPLE: toNSData("String to encode")
     */
    static func toNSData(_ string:String)->NSData{
        return string.data(using:.utf8)! as NSData//swift 3 upgrade was-> string.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    static func toInt(_ string:String)->Int{
        return Int(string)!//Convert to Int and Unwrap the returned optional by adding an exclamation point. then return it
    }
}
