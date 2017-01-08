import Foundation
//reverse
//concat<--this can be used to clone things so maybe add it?
//append
class ArrayModifier{
	/**
	 * UNSHIFT (prepend)
	 * Adds one or more elements to the beginning of an array and returns the new array count
	 * PARAM: length of the array. The other elements in the array are moved from their 
	 * original position, i, to i+1.
	 * OUTPUT
	 * a,b,c,d
     * _,a,b,c,d
     * RETURNS: An integer representing the new length of the array
     */
    static func unshift<T>(inout array:Array<T>,_ item:T, _ index:Int = 0)->Int{
		array.insert(item,atIndex:index)
		return array.count
	}
	/**
	 * SHIFT
	 * Removes the first element from an array and returns that element.
	 * NOTE: The remaining array elements are moved from their original position, i, to i-1.
     * TODO: Write an example
	 */
	static func shift<T>(inout array:[T])->T{
        return array.removeFirst()
	}
	/**
	 * POP
	 * Removes the last element from an array and returns the value of that element.
     * NOTE: try using the native: .popLast()
	 */
	static func pop<T>(inout array:[T])->T? {
        let last = array.last
        if let last = last {
            array.removeLast()
            return last
        }
        return nil
    }
     /**
	  * Removes items from @param array from @param start until @param delCount, and optionally inserts @param values
      * EXAMPLE: splice2([a,b,c],0,3)//[a,b,c]
      * EXAMPLE: splice2([a,b,c],2,1)//[c]
      * EXAMPLE: splice2([a,b,c],0,1)//[a]
      * NOTE: splice can also be used to remove item from array
      * IMPORTANT: the original array is modified
      * EXAMPLE: splice(["spinach","green pepper","cilantro","onion","avocado"],0, 1, ["tomato"])// tomato,green pepper, cilantro,onion,avocado
      * RETURNS: An array containing the elements that were removed from the original array.
      * IMPORTANT: back and forth with this method, first it returned the removed elements, then it returned the resulting array, now its confirmed that splice should return the removed elements, this can cause some problems with legacy code. Be carefull
      * TODO: You could probably use the native: array.replaceRange instead
	  */
    static func splice2<T>(inout array:[T],_ startIndex:Int,_ deleteCount:Int,_ values:Array<T> = [])->Array<T>{
        let returnArray  = slice2(array, startIndex, startIndex + deleteCount)
        array.removeRange(Range<Int>(start:startIndex,end:startIndex + deleteCount))
        if(values.count > 0 ){array.insertContentsOf(values, at: startIndex)}
        return returnArray
    }
    /**
     * NOTE: I think you can also use array.removeFirst(n: Int) on a backwards while loop, to achive the same thing and faster, but this work for now
     * EXAMPLE: ArrayModifier.slice2(["a","b","c","d","e","f"],1,6)//["b", "c", "d", "e", "f"]
     * IMPORTANT: This method does NOT alter the original array (should probably be moved to ArrayParser?)
     * RETURNS: The items from startIndex to endIndex
     */
    static func slice2<T>(array:[T],_ startIndex:Int, _ endIndex:Int)->Array<T>{//TODO:Rename this to just slice, soon!
        var arr:Array<T> = []
        for var i = startIndex; i < endIndex; ++i{arr.append(array[i])}
        return arr
    }
    /**
     * NOTE: modifies the original array
     * RETURNS: (returns the original array for convenience, usefull for chaining methods)
     * TODO: this can probably be written simpler and more optimized, or could it?  It looks pretty efficient if you think about it
     * EXAMPLE: ArrayModifier.move([1,2,3,4,5,6,7,8,9], 2, 5) //[1,2,4,5,6,3,7,8,9]
     * There is also the ArrayModifier.indexSwap method which is alot simpler and can probably do the same thing the (indexSwap method may require more or less memory, testing is needed)
     */
    static func move<T>(inout array:[T], var _ from:Int, var _ to:Int) -> Array<T> {
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
    static func shuffle<T>(inout array:[T])->[T]{
        for i in 0 ..< (array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            ArrayModifier.swap(&array, array[i], array[j])//the & sign indicates that you confirm that the values will be changed
        }
        return array
    }
    /**
     * Note: Usefull if you want to do inline appendation
     */
    static func append<T>(var array:[T],_ item:T)->Array<T>{
        array.append(item)
        return array
    }
    /**
     * Adds an item at an index while preserving the order of the array.
     * NOTE: Can be optimized a little bit more if array.length is known.
     * NOTE: For a non-optimized version go ahead and just use array.splice(index, 1, item, array[index] )
     * EXAMPLE:
     *	var array:Array = ["a","b","c"];
     *	var index:int = 1;
     *	var result:* = array.splice(index, 1, "x", array[index]);
     *	print("result: " + result)//b "the deleted item"
     *	print(array); //a,x,b,c
     * TODO: return the array for method chaning purposes?
     */
    static func addAt<T>(inout array:[T], _ item:T, _ index:Int){
        if(index == 0) {array.unshift(item)}/*add item at the begining of an array*/
        else if(array.count == index) {array.append(item)}/*add item at the end of an array*/
        else {array.splice2(index, 0, [item])}
    }
    /**
     * Removes the object from the array and return the index.
     * RETURN: the index of the object, -1 if the object is not in the array
     * TODO: should return the array not the index?
     * TODO: can we use indexOf here?
     * TODO: should we use obj:AnyObject and arr[i] === obj ???
     * IMPORTANT: This compares reference not value
     */
    static func remove(inout array:Array<AnyObject>, _ object:AnyObject)->Int{//this method seems pretty useless if it cant work with instances that arnt equatable
        for i in 0..<array.count{//swift 3
            if(array[i] === object){
                array.removeAtIndex(i)/*was --> array.splice2(i, 1)*/
                return i
            }
        }
        return -1
    }
    /**
     * New, seems to work
     * NOTE: comapres and deletes reference "===" not "=="
     */
    static func delete<T>(inout arr:Array<T>,inout _ obj:T)->T{
        return arr.removeAtIndex(ArrayParser.idx(&arr, &obj))
    }
    /**
     * TODO: I think you can also use: array.removeFirst(n: Int)
     */
    static func removeAt<T>(inout array:[T],_ i:Int)->T{//<--the return statement was recently added
        return array.removeAtIndex(i)//was -> return array.splice2(i, 1)[0]
    }
    /**
     * Returns @param array with out the items in @param these
     * @Note only removed the first instance, if there are duplicates in the @param array then they will not be removed
     * @example print("Result: "+removeThese(["A","B","C","D","F","G"], ["B","C","A","f","F"]));//D,G
     * IMPORTANT: compares reference not value, create a similar method if you need to compare value
     */
    static func removeMany<T>(inout array:Array<T>,_ many:Array<T>) -> Array<T> {
        for i in 0..<many.count{//Swift 3
            let index:Int = ArrayParser.indx(array, many[i])
            if(index != -1) {array.removeAtIndex(index)/*was --> array.splice2(index,1)*/}
        }
        return array
    }
    /**
     * NOTE: apple provides a native method aswell: [1,2,3].removeAll().count//0
     * EXAMPLE:
     * var arr = ["a","b","c","d","e","f","g","h","i","j"]
     * ArrayModifier.removeAll(arr).count//0
     */
    static func removeAll<T>(inout arr:Array<T>)->Array<T>{
        arr.forEach{_ in
            arr.removeLast()//removeFirst() also works
        }
        return arr
    }
    /**
     * Returns PARAM: array with out the items in PARAM: these by the PARAM: key
     * IMPORTANT: Compares value not reference, if reference comparing is need then create another method for that case
     * EXAMPLE:
     * var arr = [["name":"Alf"],["name":"Bert"],["name":"Bill"],["name":"John"],["name":"James"],["name":"Chuck"]]
     * let match = ["Bert","James","Chuck"]
     * let result = ArrayModifier.removeManyByKey(&arr, match, "name")
     * print("result: " + "\(result)")//Alf,Bill,John
     */
    static func removeManyByKey<T where T:Equatable, T:Comparable>(inout array:[Dictionary<String,T>],_ many:Array<T>,_ key:String) -> [Dictionary<String,T>] {
        var i:Int = 0
        while (i < array.count){//<--swift 3 support -> was simple c-style for loop
            let dict:[String:T] = array[i]
            let toMatch:T = dict[key]!
            if(ArrayParser.index(many, toMatch) != -1) {
                array.splice2(i,1)
                i -= 1
            }
            i++
        }
        return array
    }
    /**
     * Randomnizes the order of an array
     * NOTE: Randomize vs randomise -> the later is the british spelling
     * NOTE: the array is returned for the sake of convenience
     */
    static func randomize<T>(inout array:Array<T> ) -> Array<T> {
        array.sortInPlace { Bool in
            return ( Int(arc4random()) * 2 ) * 2 - 1 > 0
        }
        return array
    }
    /**
     * Remove last, insert last, this is new it could go in the AdvanceArrayModifier class
     */
    static func pushPop<T>(inout array:[T],_ item:T)->Array<T>{
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
     * print(ArrayModifier.merge(abc, def, 2));//a,b,d,e,f,c// and the def array should now be empty
     */
    static func mergeInPlaceAt<T>(inout a:Array<T>, inout _ b:Array<T>, _ i:Int) -> Array<T> {
        //TODO: test this method first
        if(i == 0) {while(b.count > 0) {a.unshift(b.splice2(b.count-1,1)[0])}}// :TODO: if splice is faster than unshift then use splice
        else if(i == a.count) {while(b.count > 0) {a.splice2(a.count,0,b.splice2(0,1))}}
        else {while(b.count > 0) {a.splice2(i,0,b.splice2(b.count-1,1))}}
        return a
    }
    /**
     * Merges b into a at index (returns a for convenience)
     * IMPORTANT: Alters PARAM: a
     * PARAM: a:Target array
     * PARAM: b: array to merged onto Target array (does not alter b)
     * PARAM: index: where on the targetArray should it merge on
     * NOTE: For a non optimized version go ahead and just use arrayA.splice(0, index).concat(arrayB,arrayA);
     * EXAMPLE: ArrayModifier.mergeAt([1,2,3], [4,5,6], 1)//[1, 4, 5, 6, 2, 3]
     */
    static func mergeAt<T>(inout a:Array<T>, _ b:Array<T>, _ index:Int) -> Array<T>{
        if(index == a.count) {a += b}/*if the index is at the end then inout concat the arrays*/
        else {a.splice2(index, 0,b)}// :TODO: test if this is correct?
        return a
    }
    /**
     * Similar to mergeAt, but does not alter the original PARAM a
     * NOTE: Strictly speaking we should move this to ArrayParser, as it doesnt modify anything
     */
    static func combineAt<T>(var a:Array<T>, _ b:Array<T>, _ index:Int) -> Array<T>{
        return mergeAt(&a, b, index)
    }
    /**
     * Splits an array in two pieces
     * RETURN: a new array with 2 arrays
     */
    static func split<T>(inout array:Array<T> ,_ index:Int) -> (a:[T],b:[T]) {
        // :TODO: this doesnt work , you need to use a combination of splice, concat and unshift also make this function not return anything, it seem to work actually
        //it cant work look at the .pop and .count
        var arrayB:Array<T> = []
        //let arrayLength:Int = array.count
        var i:Int = index+1
        while(i < array.count){
        //for(var i:Int=index+1 ; i<arrayLength ; i++) {
            arrayB.unshift(array.pop()!)//pop removes last and returns it, unshift adds an item to beginning of an array
            i += 1
        }
        let retVal:([T],[T]) = (array,arrayB/*.reverse()*/)
        return retVal
        //return [array, arrayB.reverse()]
    }
    /**
     * Split an array a integer, returns a new array with arrays in it of the split
     */
    static func splitAtEvery<T>( array:Array<T> , var _ every:Int = 1 ) -> Array<[T]> {
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
     * Swap item position in an array
     */
    static func swap<T>(inout array:Array<T>, _ item1:T, _ item2:T) {
        let index1:Int = ArrayParser.indx(array, item1)
        let index2:Int = ArrayParser.indx(array, item2)
        if(index1 != -1 && index2 != -1) {
            array[index1] = item2
            array[index2] = item1
        }
    }
    /**
     * Swaps two items in @param vector at @param index1 @param index2
     * NOTE: there is also the ArrayModifier.move method which is similar
     */
    static func indexSwap<T>(inout array:Array<T>,_ index1:Int,_ index2:Int) -> [T] {
        if(index1 != -1 && index2 != -1) {
            let a:T = array[index1]
            let b:T = array[index2]
            array[index1] = b
            array[index2] = a
        }
        return array
    }
    /**
     * Displaces the PARAM: range in PARAM: vector to PARAM: index
     * NOTE: alters the original vector
     * EXAMPLE: ArrayModifier.rangeDisplace(Array.<String>(["a","b","c","d","e","f","g"]), 2,4, 0);//c,d,a,b,e,f,g
     */
    static func rangeDisplace<T>(inout array:Array<T>,_ range:Range<Int>,_ index:Int) -> [T] {
        let splice:Array<T> = array.splice2(range.start,range.end-range.start)//<--You could probably use range.length here
        return ArrayModifier.mergeAt(&array, splice, index)//it could be more memory efficient to use mergeInPlaceAt here, tests is need to confirm
    }
    /**
     * Returns a Vector with a range that is reversed
     * NOTE: the original vector is altered, and is now unusable as is, reasign the returned Vector instance in the calling method
     * NOTE: the Vector method named splice,push and unshift doesnt support taking an Vector of items as argument only 1 by 1 so we need to resolve this with some concat trickery
     * NOTE: this method could keep the original vector intact by using slice instead of splice, but splice should be faster so it is used this way in this method
     * EXAMPLE:
     * var v:Array<Int> = [1,2,3,4,5,6,7,8,9]
     * v = ArrayModifier.reverseRange(v, 2,7)
     * Swift.print("v: " + v);//1,2,7,6,5,4,3,8,9
     */
    static func reverseRange<T>(inout vector:Array<T>,_ range:Range<Int>) -> Array<T> {
        let head:Array<T> = vector.splice2(0,range.start)
        let tail:Array<T> = vector.splice2(range.end-range.start, vector.count - (range.end-range.start))
        let reversedVector:Array<T> = vector.reverse()
        return head.concat(reversedVector).concat(tail)
    }
    /**
     * Removes a range of items from rangeStart to rangeEnd
     * RETURN: the newly altered array
     */
    static func removeRange<T>(inout array:Array<T>, _ rangeStart:Int, _ rangeEnd:Int) -> [T]{
        array.removeRange(Range<Int>(start:rangeStart,end:rangeEnd))/*was -> array.splice2(rangeStart, rangeEnd - rangeStart)*/
        return array
    }
    /**
     * Removes duplicates
     * NOTE: the following two lines may be more efficient try to factor them and see if they are good
     * EXAMPLE: var arr:Array = ["a","b","b","c","b","d","c"];
     * EXAMPLE: var z:Array = arr.filter(func (a:*,b:int,c:Array):Boolean { return ((z ? z : z = Array()).indexOf(a) >= 0 ? false : (z.append(a) >= 0)); }, self);
     */
    static func removeDuplicates<T>(array:Array<T>) -> Array<T>{
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
     * NOTE: you could also use some sort of bubble sort
     * NOTE: modifies the original array
     * TODO: You could possibly add support for Generics that can use the < and > and maybe add a boolean for forward / backward support?
     */
    static func numericSort(inout array:Array<Int>) -> Array<Int>{
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
     * Replaces PARAM: searchFor with PARAM: replaceWith (the existing item is deleted)
     * NOTE: on pretext is that the item to search for must already exist in the array or else this method doesnt work
     * NOTE: this only works if the oldItem is already in the array, if there is a chance that its not this function probably doesnt work
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is important
     */
    static func replace<T>(inout array:Array<T>, _ searchFor:T, _ replaceWith:T) -> Int {
        let index:Int = ArrayParser.indx(array, searchFor)
        array[index] = replaceWith
        return index
    }
    /**
     * TODO: make it work even if the length of the array the_replacements is longer than thhe_matches
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is important
     */
    static func replaceMany<T>(inout array:Array<T>, _ matches:Array<T>, _ replacments:Array<T>) -> Array<T>{
        for var i = 0; i < array.count; ++i{
            replace(&array, matches[i], replacments[i])
        }
        return array
    }
    /**
     * Inserts "before" PARAM index (see examples bellow)
     * EXAMPLE: ["a","b","c"].insert("x", 0)//x,a,b,c
     * EXAMPLE: ["a","b","c"].insert("x", 1)//a,x,b,c
     * EXAMPLE: ["a","b","c"].insert("x", 2)//q,b,x,c
     * EXAMPLE: ["a","b","c"].insert("x", 3)//a,b,c,x
     * RETURN: the mutated PARAM arr
     */
    static func insertAt<T>(inout arr:[T], _ item:T, _ index:Int) -> [T]{
        //Swift.print("arr.count: " + "\(arr.count)")
        arr.insert(item, atIndex: index)
        return arr
    }
    /**
     * Returns a new array derived from the @param array sans the items from @param start to @param end
     * IMPORTANT: the original array is NOT modified
     * EXAMPLE: slice(["spinach","green pepper","cilantro","onion","avocado"],1, 3)// "spinach","onion","avocado"
     */
    static func DEPRECATEDslice<T>(var array:[T],_ startIndex:Int, _ endIndex:Int)->Array<T>{
        Swift.print("use slice2 instead")
        //try not to use this method, use slice2 since that is the correct implementation of slice. Also look in to splice. I think its currently not implemented correctly
        
        let deleteCount = endIndex - startIndex
        //Swift.print("deleteCount: " + "\(deleteCount)")
        array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
        return array
    }
}
extension ArrayModifier{
    //rangeDisplace
}