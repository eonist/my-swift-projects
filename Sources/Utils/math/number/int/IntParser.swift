import Foundation
class IntParser{
    /**
     * Return a  Random number within a min max value
     */
    static func random(_ min:Int, _ max:Int)->Int{//returns an integer between 0 - x
        return Int(arc4random_uniform(UInt32(max)) + UInt32(min))
    }
    /**
     * Returns a normalized integer value
     * NOTE: Great for iterating int arrays
     * NOTE: Can be used for looping items in an array
     * EXAMPLE:
     * print(IntParser.normalize(3, 7))//3
     * print(IntParser.normalize(-3, 7))//4
     * print(IntParser.normalize(0, 7))//0
     * print(IntParser.normalize(7, 7))//0
     * print(IntParser.normalize(8, 7))//1
     * print(IntParser.normalize(12, 7))//5
     */
    static func normalize(_ index:Int,_ len:Int) -> Int {
        return index >= 0 ? (index < len ? index : index % len) : len + (index % len)
    }
    static func kind(_ theInt:Int)->String{
        switch theInt {
            case 0:
                return "Zero"
            case let x where x > 0://<--where is a constraint, must be true
                return "Positive"
            default:
                return "Negative"
        }
    }
    /**
     * EXAMPLE: minMax([8, -6, 2, 109, 3, 71])//(-6,109)
     * EXAMPLE: minMax([8, -6, 2, 109, 3, 71]).min //-6
     * EXAMPLE: minMax([8, -6, 2, 109, 3, 71]).max //109
     */
    static func minMax(_ array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        array[1..<array.count].forEach { value in
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    /**
     * Returns the max int value in PARAM: ints
     * EXAMPLE: max([1, 2, 3, 10, 100])
     * NOTE: Native [1, 5, 2, 9, 4].maxElement() ? might be better?
     */
    static func max(_ ints:[Int])->Int{
        /*var maxInt = ints[0]
         for int in ints {if maxInt < int {maxInt = int}}
         return maxInt*/
        return ints.max() ?? ints[0]
    }
    /**
     * See comment in the forward call
     */
    static func loop(_ index:Int, _ start:Int, _ end:Int) -> Int{// :TODO: start,end,index is easier to understand
        return CGFloatParser.loop(index.cgFloat,start.cgFloat,end.cgFloat).int
    }
}
