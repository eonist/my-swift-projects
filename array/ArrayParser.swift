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
}