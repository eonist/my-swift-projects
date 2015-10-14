class ArrayModifier{
	/**
	 * UNSHIFT
	 * Adds one or more elements to the beginning of an array and returns the new
	 * length of the array. The other elements in the array are moved from their 
	 * original position, i, to i+1.
	 * OUTPUT
	 * a,b,c,d
    * _,a,b,c,d
	 */
	class func unshift(inout array:Array<T>,item:Any)->Int{
		array.insert(item,atIndex:0)
		return array.count
	}
	/**
	 * SHIFT
	 * Removes the first element from an array and returns that element.
	 * The remaining array elements are moved from their original position, i, to i-1.
	 */
	class func shift(inout array:Array<T>)->Any{
		return array.removeAt(0)
	}
	/**
	 * POP
	 * Removes the last element from an array and returns the value of that element.
	 */
	class func pop(array:Array)->Element? {
        let last = self.last
        if let last = last {
            array.removeLast()
            return last
        }
        return nil
    }
    /**
	  * 
	  */
    class func splice(array:Array,startIndex:UInt,deleteCount:UInt, values:[Element])->Array {
        var returnArray = array
        returnArray.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        returnArray.insertContentsOf(values, at: Int(startIndex))
        return returnArray
    }
    
}
//combine
//merge
//bubblesort
//swap