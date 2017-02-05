import Foundation

class UIntParser {
    /**
    * Returns a normalized unsigned integer value
    * NOTE: great for iterating uint arrays
    * NOTE: if the PARAM: index is the same as the PARAM: len then 0 is returned
    * NOTE: can be used for looping items in an array
    * EXAMPLE:
    * print(UintParser.normalize(0, 4));//0
    * print(UintParser.normalize(1, 4));//1
    * print(UintParser.normalize(2, 4));//2
    * print(UintParser.normalize(3, 4));//3
    * print(UintParser.normalize(4, 4));//0
    * print(UintParser.normalize(5, 4));//1
    * print(UintParser.normalize(6, 4));//2
    * print(UintParser.normalize(7, 4));//3
    * print(UintParser.normalize(8, 4));//0
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
        let leftOver:Int = numOfDigits - stringNum.count
        return "0" * leftOver + String(n)
    }
}
