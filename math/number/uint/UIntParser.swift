import Foundation

class UIntParser {
    /**
     * Adds a zero infront of a number
     */
    class func digit(n:UInt,_ numOfDigits:Int)->String{
        let stringNum:String = String(n)
        let leftOver:Int = numOfDigits - stringNum.count
        return "0" * leftOver + String(n)
    }
}
