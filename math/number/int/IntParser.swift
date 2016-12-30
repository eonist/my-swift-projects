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
     * Returns a constant looping number, really great when making looping slideshows
     * @param index: the current cursor of an infinite loop
     * @param start: the start of the loop
     * @param end: end of the loop
     * @return a number between @param start number and the @param end of the loop
     * @Note take a look at IntParser.normalize(index,len) it may solve some cases simpler, and it could be extended into antoher method that does what this method does but way simpler and faster
     * @Note UintParser.normalize alos works well for uint values
     * // :TODO: Could be refactor to be simpler and more efficient
     * // :TODO: look at the while loop in Angle.normalize1() it could make this this class simpler by refactoring it the same way
     * @example
     * trace("test "+(NumberParser.loop(20, 0, 10)));//0
     * trace("test "+(NumberParser.loop(-2, -5, 10)));//8
     */
    static func loop(index:Int, _ start:Int, _ end:Int) -> Int{// :TODO: start,end,index is easier to understand
        var r:Int;
        var direction:Int
        if(start < end) {direction = +1}/*Analyse the relationship between start and end*/
        else if(start > end) {direction = -1}
        if(index.positive){r = start - (index * direction)}//Analyse the index direction
        else{r = start + (index * direction)}
        var resultEndDist:CGFloat = NumberParser.distance(r, end);
        var startEndDist:CGFloat = NumberParser.distance(start,end);
        var remainder:Number = resultEndDist % startEndDist;//Modulo returns the remainder
        var increment:int;
        if(remainder == 0)increment = 0;
        else if(index > 0 && resultEndDist > startEndDist)increment = remainder;//Fix the check after && is ugly
        else increment = (startEndDist - remainder);
        r = start + (direction * increment);
        return r;
    }
}