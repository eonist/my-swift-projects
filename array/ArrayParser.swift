class ArrayParser{
	/**
	 * returns the index for item, -1 of none is found
	 */
	class func index<T: Equatable>(array: [T], _ value: T) -> Int? {//the <T: Equatable> part ensures that the types can use the equal operator ==
	    for (index, item) in array.enumerate() {
	        if value == item {
	            return index
	        }
	    }
	    return -1
	}
    
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     * NOTE: you can also do things like {$0 > 5} , {$0 == str}  etc
     */
    class func indexOfStr(arr:Array<String>,str:String)->Int{
        if let index = arr.indexOf(str) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     *
     */
    class func indexOfObj<T : Equatable>(arr : [T], _ value:T)->Int{
        if let index = arr.indexOf(value) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
}