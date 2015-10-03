class ArrayParser{
	/**
	 * returns the index for item, -1 of none is found
	 */
	func index(items: [T], _ item: T) -> Int? {
	    for (index, item) in array.enumerate() {
	        if value == item {
	            return index
	        }
	    }
	    return -1
	}
}