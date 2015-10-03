class ArrayParser{
	/**
	 * returns the index for item, -1 of none is found
	 */
	func index(items: [Any], _ item: Any) -> Int? {
	    for (index, item) in array.enumerate() {
	        if value == item {
	            return index
	        }
	    }
	    return -1
	}
}