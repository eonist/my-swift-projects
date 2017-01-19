import Foundation

class UIntParser {
    /**
    * Returns a normalized unsigned integer value
    * NOTE: great for iterating uint arrays
    * NOTE: if the PARAM: index is the same as the PARAM: len then 0 is returned
    * NOTE: can be used for looping items in an array
    * EXAMPLE:
    * trace(UintParser.normalize(0, 4));//0
    * trace(UintParser.normalize(1, 4));//1
    * trace(UintParser.normalize(2, 4));//2
    * trace(UintParser.normalize(3, 4));//3
    * trace(UintParser.normalize(4, 4));//0
    * trace(UintParser.normalize(5, 4));//1
    * trace(UintParser.normalize(6, 4));//2
    * trace(UintParser.normalize(7, 4));//3
    * trace(UintParser.normalize(8, 4));//0
    */
    static func normalize(_ index:UInt, _ len:UInt)->UInt{
        return index < len ? index : index % len
    }
    /**
     * Adds a zero infront of a number
     * TODO: refactor this code when you have time
     * EXAMPLE: Swift.print(UIntParser.digit(9, 2))
     */
    static func digit(_ n:UInt,_ numOfDigits:Int)->String{
        let stringNum:String = String(n)
        //Swift.print("stringNum.count: " + "\(stringNum.count)")
        let leftOver:Int = numOfDigits - stringNum.count
        //Swift.print("leftOver: " + "\(leftOver)")
        return "0" * leftOver + String(n)
    }
}
