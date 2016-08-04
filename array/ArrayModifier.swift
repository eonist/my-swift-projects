import Foundation
//reverse
//concat<--this can be used to clone things so maybe add it?
//append
class ArrayModifier{
	/**
	 * UNSHIFT
	 * Adds one or more elements to the beginning of an array and returns the new
	 * length of the array. The other elements in the array are moved from their 
	 * original position, i, to i+1.
	 * OUTPUT
	 * a,b,c,d
     * _,a,b,c,d
     * RETURNS: An integer representing the new length of the array

	 */
    class func unshift<T>(inout array:Array<T>,_ item:T, _ index:Int = 0)->Int{
		array.insert(item,atIndex:index)
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
      * RETURNS: An array containing the elements that were removed from the original array.
      * IMPORTANT: back and forth with this method, first it returned the removed elements, then it returned the resulting array, now its confirmed that splice should return the removed elements, this can cause some problems with legacy code. Be carefull
	  */
    class func splice2<T>(inout array:[T],_ startIndex:Int,_ deleteCount:Int,_ values:Array<T> = [])->Array<T>{
        let returnArray  = Utils.range(array, startIndex, startIndex + deleteCount)
        array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        if(values.count > 0 ){array.insertContentsOf(values, at: Int(startIndex))}
        return returnArray
    }
    /**
     * Returns a new array derived from the @param array sans the items from @param start to @param end
     * IMPORTANT: the original array is NOT modified
     * slice(["spinach","green pepper","cilantro","onion","avocado"],1, 3)// "spinach","onion","avocado"
     */
    class func DEPRECATEDslice<T>(var array:[T],_ startIndex:Int, _ endIndex:Int)->Array<T>{
        
        //try not to use this method, use slice2 since that is the correct implementation of slice. Also look in to splice. I think its currently not implemented correctly
        
        let deleteCount = endIndex - startIndex
        //Swift.print("deleteCount: " + "\(deleteCount)")
        array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        return array
    }
    /**
     * NOTE: I think you can also use array.removeFirst(n: Int) on a backwards while loop, to achive the same thing and faster, but this work for now
     * EXAMPLE: ArrayModifier.slice2(["a","b","c","d","e","f"],1,6)//["b", "c", "d", "e", "f"]
     * IMPORTANT: This method does NOT alter the original array (should probably be moved to ArrayParser?)
     * RETURNS: The items from startIndex to endIndex
     */
    class func slice2<T>(var array:[T],_ startIndex:Int, _ endIndex:Int)->Array<T>{//TODO:Rename this to just slice, soon!
        let range = Utils.range(array, startIndex, endIndex)
        let deleteCount = endIndex - startIndex//<--This seems not to be needed, remove it
        array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        return range
    }
    /**
     * NOTE: modifies the original array
     * RETURNS: (returns the original array for convenience, usefull for chaining methods)
     * // :TODO: this can probably be written simpler and more optimized, or could it it looks pretty efficient if you think about it
     */
    class func move<T>(inout array:[T], var _ from:Int, var _ to:Int) -> Array<T> {
        if(to < from) {
            array.splice2(to, 0, [array[from]])
            from++
            array.splice2(from, 1)
        }else{
            to++
            array.splice2(to, 0, [array[from]])
            array.splice2(from, 1)
        }
        return array
    }
    /**
     * NOTE: In iOS 9 and OS X 10.11, you don't have to write your own. There's an efficient, correct implementation of Fisher-Yates in GameplayKit (which, despite the name, is not just for games).
     * NOTE: GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(array)
     * NOTE: If you want to be able to replicate a shuffle or series of shuffles, choose and seed a specific random source; e.g.
     * NOTE: GKLinearCongruentialRandomSource(seed: mySeedValue).arrayByShufflingObjectsInArray(array)
     * EXAMPLE: shuffle([1, 2, 3, 4, 5, 6, 7, 8])// e.g., [4, 2, 6, 8, 7, 3, 5, 1]
     */
    class func shuffle<T>(inout array:[T])->[T]{
        for i in 0 ..< (array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            swap(&array[i], &array[j])//the & sign indicates that you confirm that the values will be changed
        }
        return array
    }
    /**
     * Note: Usefull if you want to do inline appendation
     */
    class func append<T>(var array:[T],_ item:T)->Array<T>{
        array.append(item)
        return array
    }
    /**
     * Adds an item at an index while preserving the order of the array.
     * @Note: Can be optimized a little bit more if array.length is known.
     * @Note: For a non-optimized version go ahead and just use array.splice(index, 1, item, array[index] )
     * @example:
     *	var array:Array = ["a","b","c"];
     *	var index:int = 1;
     *	var result:* = array.splice(index, 1, "x", array[index]);
     *	print("result: " + result);//b "the deleted item"
     *	print(array); //a,x,b,c
     * TODO: return the array for method chaning purposes?
     */
    class func addAt<T>(inout array:[T], _ item:T, _ index:Int){
        if(index == 0) {array.unshift(item)}
        else if(array.count == index) {array.append(item)}
        else {array.splice2(index, 0, [item])}
    }
    /**
     * Removes the object from the array and return the index.
     * @return the index of the object, -1 if the object is not in the array
     * // :TODO: should return the array not the index?
     * // :TODO: can we use indexOf here?
     * // :TODO: should we use obj:AnyObject and arr[i] === obj ???
     * IMPORTANT: This compares reference not value
     */
    class func remove(inout array:Array<AnyObject>, object:AnyObject)->Int{//this method seems pretty useless if it cant work with instances that arnt equatable
        for(var i:Int=0; i<array.count; i++){
            if(array[i] === object){
                array.splice2(i, 1);
                return i;
            }
        }
        return -1;
    }
    /**
     * NOTE: I think you can also use: array.removeFirst(n: Int)
     */
    class func removeAt<T>(inout array:[T],_ i:Int)->T{//<--the return statement was recently added
        return array.splice2(i, 1)[0]
    }
    /**
    * Returns @param array with out the items in @param these
    * @Note only removed the first instance, if there are duplicates in the @param array then they will not be removed
    * @example print("Result: "+removeThese(["A","B","C","D","F","G"], ["B","C","A","f","F"]));//D,G
    * IMPORTANT: compares reference not value, create a similar method if you need to compare value
    */
    class func removeMany<T>(inout array:Array<T>,_ many:Array<T>) -> Array<T> {
        for (var i : Int = 0; i < many.count; i++) {
            let index:Int = ArrayParser.indx(array, many[i])
            if(index != -1) {array.splice2(index,1)}
        }
        return array
    }
    /**
     * Returns @param array with out the items in @param these by the @param key
     * @example trace("result: " + ArrayParser.describe(removeTheseByKey([{name:"Alf"},{name:"Bert"},{name:"Bill"},{name:"John"},{name:"James"},{name:"Chuck"}], ["Bert","James","Chuck"], "name")));//Alf,Bill,John
     */
    class func removeManyByKey<T>(inout array:[Dictionary<T,T>],_ many:Array<String>,_ key:String) -> [Dictionary<T,T>] {
        for (var i : Int = 0; i < array.count; i++) {if(ArrayParser.index(many, "") != -1) { array.splice2(i--,1) }}
        return array
    }
    /**
     * @description  randomnizes the order of an array
     * NOTE: Randomize vs randomise -> the later is the british spelling
     * NOTE: the array is returned for the sake of convenience
     */
    class func randomize<T>(inout array:Array<T> ) -> Array<T> {
        array.sortInPlace { Bool in
            return ( Int(arc4random()) * 2 ) * 2 - 1 > 0
        }
        return array
    }
    /**
     * insert beginning remove last, this is new it could go in the AdvanceArrayModifier class
     */
    class func pushPop<T>(inout array:[T],_ item:T)->Array<T>{
        array.popLast()
        array.append(item)
        return array
    }
    /**
     * Merges Array instance @param a into Array instance @param b at index @param i
     * IMPORTANT: Alters PARAM: a and PARAM: b
     * RETURNS: The altered Array instance @param a
     * var abc:Array = ["a","b","c"];
     * var def:Array = ["d","e","f"];
     * print(ArrayModifier.merge(abc, def, 2));//a,b,d,e,f,c
     */
    class func mergeInPlaceAt<T>(inout a:Array<T>, inout _ b:Array<T>, _ i:Int) -> Array<T> {
        if(i == 0) {while(b.count > 0) {a.unshift(b.splice2(b.count-1,1)[0])}}// :TODO: if splice is faster than unshift then use splice
        else if(i == a.count) {while(b.count > 0) {a.splice2(a.count,0,b.splice2(0,1))}}
        else {while(b.count > 0) {a.splice2(i,0,b.splice2(b.count-1,1))}}
        return a
    }
    /**
     * Returns a new array that has merged arrayB onto arrayA at a spessific index on arrayA (keeps the original PARAM: a intact)
     * IMPORTANT: Alters PARAM: a
     * @param a:Target array
     * @param b: array to merged onto Target array
     * @param index: where on the targetArray should it merge on
     * @Note For a non optimized version go ahead and just use arrayA.splice(0, index).concat(arrayB,arrayA);
     * @Note To merge two arrays directly you can use concat, some sort of split function and while(b.length > 0) a.unshift(b.splice(b.length-1,1));
     * EXAMPLE: print(ArrayModifier.merge(["a","b","c"], ["1","2","3"], 1));//a,1,2,3,b,c
     */
    class func mergeAt<T>(inout a:Array<T>, _ b:Array<T>, _ index:Int) -> Array<T>{
        if(index == 0) {return b.concat(a)}
        else if(index == a.count) {return a.concat(b)}
        else {return a.splice2(0, index) + b + a}// :TODO: test if this is correct?
    }
    /**
     * Similar to mergeAt, but does not alter the original PARAM a
     * EXAMPLE: Swift.print(ArrayModifier.combineAt(["a","b","c"], ["1","2","3"], 1))//["a", "1", "2", "3", "b", "c"]
     * NOTE: Strictly speaking we should move this to ArrayParser, as it doesnt modify anything
     */
    class func combineAt<T>(var a:Array<T>, _ b:Array<T>, _ index:Int) -> Array<T>{
        return mergeAt(&a, b, index)
    }
    
    /**
     * splits an array in two pieces
     * @return a new array with 2 arrays
     */
    class func split<T>(inout array:Array<T> ,_ index:Int) -> Array<[T]> {// :TODO: this doesnt work , you need to use a combination of splice, concat and unshift also make this function not return anything, it seem to work actually
        var arrayB:Array<T> = []
        let arrayLength:Int = array.count
        for(var i:Int=index+1 ; i<arrayLength ; i++) {arrayB.append(array.pop()!)}
        return [array, arrayB.reverse()]
    }
    /**
     * @description Split an array a integer, returns a new array with arrays in it of the split
     */
    class func splitAtEvery<T>( array:Array<T> , var _ every:Int = 1 ) -> Array<[T]> {
        let copy:Array<T> = array.concat([])
        var list:Array<[T]> = []
        every = max(every, 1)
        for ( var i:Int = 0 , n:Int = ceil((copy.count / every).float).int ;i < n ;i++ ) {
            let a:Int = i * every
            let b:Int = min(a + every, copy.count)
            let split:Array<T> = copy.slice2(a, b)
            list.append(split)
        }
        return list
    }
    /**
     * @description  swap item position in an array
     */
    class func swap<T>(inout array:Array<T>, item1:T, item2:T) {
        let index1:Int = ArrayParser.indx(array, item1)
        let index2:Int = ArrayParser.indx(array, item2)
        if(index1 != -1 && index2 != -1) {
            array[index1] = item2
            array[index2] = item1
        }
    }
    /**
     * swaps two items in @param vector at @param index1 @param index2
     */
    class func indexSwap<T>(inout array:Array<T>,_ index1:Int,_ index2:Int) -> [T] {
        if(index1 != -1 && index2 != -1) {
            let a:T = array[index1]
            let b:T = array[index2]
            array[index1] = b
            array[index2] = a
        }
        return array
    }
    /**
     * Displaces the @param range in @param vector to @param index
     * @Note alters the original vector
     * @example ArrayModifier.rangeDisplace(Array.<String>(["a","b","c","d","e","f","g"]), 2,4, 0);//c,d,a,b,e,f,g
     */
    class func rangeDisplace<T>(inout array:Array<T>,_ rangeStart:Int,_ rangeEnd:Int,_ index:Int) -> [T] {
        let splice:Array<T> = array.splice2(rangeStart,rangeEnd-rangeStart)
        return ArrayModifier.mergeAt(&array, splice, index)
    }
    
    /**
     * Returns a Vector with a range that is reversed
     * @Note the original vector is altered, and is now unusable as is, reasign the returned Vector instance in the calling method
     * @Note the Vector method named splice,push and unshift doesnt support taking an Vector of items as argument only 1 by 1 so we need to resolve this with some concat trickery
     * @Note this method could keep the original vector intact by using slice instead of splice, but splice should be faster so it is used this way in this method
     * EXAMPLE:
     * var v:Array<Int> = [1,2,3,4,5,6,7,8,9]
     * v = arrayModifier.reverseRange(v, 2,7)
     * Swift.print("v: " + v);//1,2,7,6,5,4,3,8,9
     */
    class func reverseRange<T>(inout vector:Array<T>,_ rangeStart:Int,_ rangeEnd:Int) -> Array<T> {
        let head:Array<T> = vector.splice2(0,rangeStart)
        let tail:Array<T> = vector.splice2(rangeEnd-rangeStart, vector.count - (rangeEnd-rangeStart))
        let reversedVector:Array<T> = vector.reverse()
        return head.concat(reversedVector).concat(tail)
    }
    
    /**
     * Removes a range of items from rangeStart to rangeEnd
     */
    class func removeRange<T>(inout array:Array<T>, _ rangeStart:Int, _ rangeEnd:Int) -> [T]{
        array.splice2(rangeStart, rangeEnd - rangeStart)
        return array
    }
    /**
     * Removes duplicates
     * NOTE: the following two lines may be more efficient try to factor them and see if they are good
     * var arr:Array = ["a","b","b","c","b","d","c"];
     * var z:Array = arr.filter(func (a:*,b:int,c:Array):Boolean { return ((z ? z : z = Array()).indexOf(a) >= 0 ? false : (z.append(a) >= 0)); }, self);
     */
    class func removeDuplicates<T>(array:Array<T>) -> Array<T>{
        var tempArray:Array<T> = []
        for (var i:Int = 0; i<array.count; i++){
            let obj1:T = array[i]
            var exists:Bool = false
            for (var j:Int = 0; j<tempArray.count; j++){
                let obj2:T = tempArray[j]
                if ((obj2 as! AnyObject) === (obj1 as! AnyObject)) {exists = true}//<--if this casting doesnt work, try the indexOf method that suports reference compaaring
            }
            if (!exists) {tempArray.append(obj1)}
        }
        return tempArray
    }
    /**
     * Very simple numeric sorter
     * @Note you could also use some sort of bubble sort
     * @Note modifies the original array
     * TODO: You could possibly add support for Generics that can use the < and > and maybe add a boolean for forward / backward support?
     */
    class func numericSort(inout array:Array<Int>) -> Array<Int>{
        for (var i : Int = 1; i < array.count; i++) {
            var e:Int = i;
            while(array[i] < array[e-1]){
                e--;
            }
            ArrayModifier.move(&array, i, e);
        }
        return array
    }
    /**
     * Replaces @param searchFor with @param replaceWith (the existing item is deleted)
     * @Note on pretext is that the item to search for must already exist in the array or else this method doesnt work
     * @Note this only works if the oldItem is already in the array, if there is a chance that its not this function probably doesnt work
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is important
     */
    class func replace<T>(inout array:Array<T>, _ searchFor:T, _ replaceWith:T) -> Int {
        let index:Int = ArrayParser.indx(array, searchFor)
        array[index] = replaceWith
        return index
    }
    /**
     * TODO: make it work even if the length of the array the_replacements is longer than thhe_matches
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is important
     */
    class func replaceMany<T>(inout array:Array<T>, _ matches:Array<T>, _ replacments:Array<T>) -> Array<T>{
        for var i = 0; i < array.count; ++i{
            replace(&array, matches[i], replacments[i])
        }
        return array
    }
}
//combine
//bubblesort
private class Utils{
    /**
     *
     */
    class func range<T>(array:Array<T>, _ start:Int,_ end:Int) -> Array<T>{
        var arr:Array<T> = []
        for var i = start; i < end; ++i{arr.append(array[i])}
        return arr
    }
}