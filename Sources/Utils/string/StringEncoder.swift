import Foundation

class StringEncoder{
    /**
     * EXAMPLE: toNSData("String to encode")
     * NOTE: ⚠️️ swift 3 upgrade was-> string.dataUsingEncoding(NSUTF8StringEncoding)!
     */
    static func toNSData(_ string:String)->NSData{
        return string.data(using:.utf8)! as NSData
    }
    static func toInt(_ string:String)->Int{
        return Int(string)!//Convert to Int and Unwrap the returned optional by adding an exclamation point. then return it
    }
}
