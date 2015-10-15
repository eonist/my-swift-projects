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
	class func unshift<T>(inout array:[T],item:T)->Int{
		array.insert(item,atIndex:0)
		return array.count
	}
	/**
	 * SHIFT
	 * Removes the first element from an array and returns that element.
	 * The remaining array elements are moved from their original position, i, to i-1.
     * TODO: Write an example
	 */
	class func shift<T>(inout array:[T])->T{
        return array.removeFirst()
	}
	/**
	 * POP
	 * Removes the last element from an array and returns the value of that element.
	 */
	class func pop<T>(inout array:[T])->T? {
        let last = array.last
        if let last = last {
            array.removeLast()
            return last
        }
        return nil
    }
    /**
	  * Removes items from @param array from @param start until @param delCount, and optionally inserts @param values
      * NOTE: splice can also be used to remove item from array
      * IMPORTANT: the original array is modified
      * NOTE: values used to be: values:[Element], but didnt work
      * EXAMPLE: splice(["spinach","green pepper","cilantro","onion","avocado"],0, 1, ["tomato"])// tomato,cilantro,onion,green pepper,avocado
	  */
    class func splice<T>(inout array:[T],startIndex:UInt,deleteCount:UInt,values:Array<T>)->Array<T>{
        var returnArray = array
        returnArray.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        if(values.count > 0 ){returnArray.insertContentsOf(values, at: Int(startIndex))}
        return returnArray
    }
    /**
     * TODO: Impliment this
     * IMPORTANT: the original array is NOT modified
     */
    class func slice<T>(array:[T],startIndex:Int, endIndex:Int)->Array<T>{
        return Array()
    }
}
//combine
//merge
//bubblesort
//swap