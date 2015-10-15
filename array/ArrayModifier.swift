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
     * Returns a new array derived from the @param array sans the items from @param start to @param end
     * IMPORTANT: the original array is NOT modified
     * slice(["spinach","green pepper","cilantro","onion","avocado"],1, 3)// "spinach","onion","avocado"
     */
    class func slice<T>(var array:[T],startIndex:Int, endIndex:Int)->Array<T>{
        let deleteCount = endIndex - startIndex
        array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        return array
    }
    
    //reverse
    //concat
    //append
    /**
     * NOTE: In iOS 9 and OS X 10.11, you don't have to write your own. There's an efficient, correct implementation of Fisher-Yates in GameplayKit (which, despite the name, is not just for games).
     * NOTE: GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
     * NOTE: If you want to be able to replicate a shuffle or series of shuffles, choose and seed a specific random source; e.g.
     * NOTE: GKLinearCongruentialRandomSource(seed: mySeedValue).arrayByShufflingObjectsInArray(array)
     *
     */
    class func shuffle(array:Array){
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
}
//combine
//merge
//bubblesort
//swap