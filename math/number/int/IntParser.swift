class IntParser{
    /**
     * Returns a normalized integer value
     * @Note great for iterating int arrays
     * @Note can be used for looping items in an array
     * @example
     * print(IntParser.normalize(3, 7));//3
     * print(IntParser.normalize(-3, 7));//4
     * print(IntParser.normalize(0, 7));//0
     * print(IntParser.normalize(7, 7));//0
     * print(IntParser.normalize(8, 7));//1
     * print(IntParser.normalize(12, 7));//5
     */
    static func normalize(index:Int,_ len:Int/*UInt*/) -> Int/*UInt*/ {
        return index >= 0 ? (index < len ? index : index % len) : len + (index % len)
    }
	/**
	 * 
	 */
    class func kind(theInt:Int)->String{
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
     * example: minMax([8, -6, 2, 109, 3, 71])//(-6,109)
     * example: minMax([8, -6, 2, 109, 3, 71]).min //-6
     * example: minMax([8, -6, 2, 109, 3, 71]).max //109
     */
    class func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    /**
     * Returns the max int value in @param ints
     * EXAMPLE: max([1, 2, 3, 10, 100])
     */
    class func max(ints:Array<Int>)->Int{
        var maxInt = ints[0]
        for int in ints {if maxInt < int {maxInt = int}}
        return maxInt
    }
    /**
     * See comment in the forward call
     */
    static func loop(index:Int, _ start:Int, _ end:Int) -> Int{// :TODO: start,end,index is easier to understand
        return NumberParser.loop(index.cgFloat,start.cgFloat,end.cgFloat).int
    }
}