class ArrayParser{
	/**
	 * returns the index for item, -1 of none is found
	 */
	class func index<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {//the <T: Equatable> part ensures that the types can use the equal operator ==
	    for (index, item) in array.enumerate() {
	        if value == item {
	            return index
	        }
	    }
	    return -1
	}
	class func pop(array:Array)->Element? {
        let last = self.last
        if let last = last {
            array.removeLast()
            return last
        }
        return nil
    }
    class func splice(array:Array,startIndex:UInt,deleteCount:UInt, values:[Element])->Array {
        var returnArray = array
        returnArray.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        returnArray.insertContentsOf(values, at: Int(startIndex))
        return returnArray
    }
}