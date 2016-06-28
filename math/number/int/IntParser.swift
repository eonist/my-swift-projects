class IntParser{
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
}