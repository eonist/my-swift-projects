import Foundation

class UIntParser {
    /**
     * Adds a zero infront of a number
     * TODO: refactor this code when you have time
     * EXAMPLE: Swift.print(UIntParser.digit(9, 2))
     */
    class func digit(n:UInt,_ numOfDigits:Int)->String{
        let stringNum:String = String(n)
        //Swift.print("stringNum.count: " + "\(stringNum.count)")
        let leftOver:Int = numOfDigits - stringNum.count
        //Swift.print("leftOver: " + "\(leftOver)")
        return "0" * leftOver + String(n)
    }
}