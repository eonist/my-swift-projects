import Foundation
/**
 * There is also: dropLast and dropFirst: Swift.print("arr: " + "\(Array([0,1,2,3].dropLast()))")//[0, 1, 2]
 */
class ArrayModifier{
    
	/**
	 * Adds one or more elements to the beginning of an array and returns the new length of the array.
	 * NOTE: The other elements in the array are moved from their
     * NOTE: unShift is the same as "prepend"
	 * original position, i, to i+1.
	 * OUTPUT:
	 * let arr = [a,b,c,d];arr.unShift(X)
     * print(arr)//[x,a,b,c,d]
     * RETURNS: An integer representing the new length of the array
     */
    static func unshift<T>(_ array: inout [T],_ item:T, _ index:Int = 0)->Int{
		array.insert(item,at:index)
		return array.count
	}
	/**
	 * Removes the first element from an array and returns that element.
	 * NOTE: The remaining array elements are moved from their original position, i, to i-1.
     * EXAMPLE:
     * var a = ["a","b","c"]
     * Swift.print("a.shift(): " + "\(a.shift())")//a
     * Swift.print("a: " + "\(a)")//b,c
	 */
	static func shift<T>(_ array: inout [T])->T{
        return array.removeFirst()
	}
	/**
	 * POP
	 * Removes the last element from an array and returns the value of that element.
     * NOTE: try using the native: .popLast()
	 */
	static func pop<T>(_ array:inout [T])->T? {
        let last = array.last
        if let last = last {
            array.removeLast()
            return last
        }
        return nil
    }
     /**
	  * Removes items from PARAM: array from PARAM: start until PARAM: delCount, and optionally inserts PARAM: values
      * RETURNS: An array containing the elements that were removed from the original array.
      * NOTE: splice can also be used to remove item from array
      * EXAMPLE: [1,2,3,4].splice(0, 1).count//3
      * EXAMPLE: splice(["spinach","green pepper","cilantro","onion","avocado"],0, 1, ["tomato"])// tomato,green pepper, cilantro,onion,avocado
      * IM ORTANT: the original array is modified
      * IMPORTANT: back and forth with this method, first it returned the removed elements, then it returned the resulting array, now its confirmed that splice should return the removed elements, this can cause some problems with legacy code. Be carefull
      * EXAMPLE: splice2([a,b,c],0,3)//[a,b,c]
      * EXAMPLE: splice2([a,b,c],2,1)//[c]
      * EXAMPLE: splice2([a,b,c],0,1)//[a]
      * TODO: You could probably use the native: array.replaceRange instead
      * ⚠️️ implement native: arr.insert(contentsOf:at:) bellow
	  */
    static func splice2<T>(_ arr:inout [T],_ startIdx:Int,_ delCount:Int,_ values:[T] = [])->[T]{
        let returnArray  = slice2(arr, startIdx, startIdx + delCount)
        arr.removeSubrange(startIdx..<startIdx + delCount)
        if(values.count > 0 ){arr.insert(contentsOf: values, at: startIdx)}
        return returnArray
    }
    /**
     * Old-school implementation of slice
     * IMPORTANT: ⚠️️ This method does NOT alter the original array
     * IMPORTANT: ⚠️️ let arr:[Int] = [1,2,3,4,5]; arr.slice2(0,arr.count)//1,2,3,4,5. if you use .count-1 then you get all but the last
     * RETURNS: The items from startIndex to endIndex
     * EXAMPLE: ArrayModifier.slice2(["a","b","c","d","e","f"],1,6)//["b", "c", "d", "e", "f"]
     * NOTE: ⚠️️ you can also use the native [1,2,3,4,5][0..<3]//[1,2,3]//⚠️️ does not support all array types
     * TODO: ⚠️️ should probably be moved to ArrayParser?
     */
    static func slice2<T>(_ array:[T],_ startIndex:Int, _ endIndex:Int)->[T]{//TODO:Rename this to just slice, soon!
        return Array(array[startIndex..<endIndex])
    }
    /**
     * NOTE: modifies the original array
     * RETURNS: (returns the original array for convenience, usefull for chaining methods)
     * TODO: this can probably be written simpler and more optimized, or could it?  It looks pretty efficient if you think about it
     * EXAMPLE: ArrayModifier.move([1,2,3,4,5,6,7,8,9], 2, 5) //[1,2,4,5,6,3,7,8,9]
     * NOTE: There is also the ArrayModifier.indexSwap method which is alot simpler and can probably do the same thing the (indexSwap method may require more or less memory, testing is needed) (unlike swap move is only 1-way)
     * TODO: ⚠️️ Use a splice method that doesnt return (more optimized this way)
     */
    static func displace<T>(_ array:inout [T], _ from:Int, _ to:Int) -> [T] {
        var from = from
        var to = to
        if(to < from) {
            _ = array.splice2(to, 0, [array[from]])
            from += 1
            _ = array.splice2(from, 1)
        }else{
            to += 1
            _ = array.splice2(to, 0, [array[from]])
            _ = array.splice2(from, 1)
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
    static func shuffle<T>(_ array:inout [T])->[T]{
        for i in 0 ..< (array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            ArrayModifier.swap(&array, array[i], array[j])//the & sign indicates that you confirm that the values will be changed
        }
        return array
    }
    /**
     * Adds an item at an index while preserving the order of the array.
     * NOTE: Can be optimized a little bit more if array.length is known.
     * NOTE: For a non-optimized version go ahead and just use array.splice(index, 1, item, array[index] )
     * EXAMPLE:
     * var array:Array = ["a","b","c"];
     * let index:Int = 1
     * let result = array.splice2(index, 1, ["x",array[index]] )
     * print("result: \(result)" )//b "the deleted item"
     * print(array) //a,x,b,c
     * TODO: return the array for method chaning purposes?
     * NOTE: ArrayModifier.insertAt does the same thing as this method
     * ⚠️️ implement native: arr.insert(contentsOf:at:) bellow
     */
    static func addAt<T>(_ array:inout [T], _ item:T, _ index:Int){
        if(index == 0) {_ = array.unshift(item)}/*add item at the begining of an array*/
        else if(index == array.count) {array.append(item)}/*add item at the end of an array*/
        else {_ = array.splice2(index, 0, [item])}
    }
    /**
     * Removes the object from the array and return the index.
     * RETURN: the index of the object, -1 if the object is not in the array
     * TODO: should return the array not the index?
     * TODO: can we use indexOf here?
     * TODO: should we use obj:AnyObject and arr[i] === obj ???
     * IMPORTANT: This compares reference not value
     */
    static func remove(_ array:inout [AnyObject], _ object:AnyObject)->Int{//this method seems pretty useless if it cant work with instances that arnt equatable
        if let i = array.index(where: {$0 === object}){
            array.remove(at: i)
            return i
        }
        return -1
    }
    /**
     * New
     */
    /*
    static func remove<T>(_ array:[T], instance:T) -> Int{
        if let i = array.index(where: {$0 === instance}){
            array.remove(at: i)
            return i
        }
        return -1
    }
 */
    /**
     * NOTE: compres and deletes reference "===" not "=="
     */
    static func delete<T>(_ arr:inout [T], _ obj:inout T)->T{
        return arr.remove(at: ArrayParser.idx(&arr, &obj))
    }
    /**
     * TODO: I think you can also use: array.removeFirst(n: Int)
     */
    static func removeAt<T>(_ array:inout [T],_ i:Int)->T{//<--the return statement was recently added
        return array.remove(at: i)//was -> return array.splice2(i, 1)[0]
    }
    /**
     * Returns PARAM: array with out the items in PARAM: these
     * NOTE: only removed the first instance, if there are duplicates in the PARAM: array then they will not be removed
     * EXAMPLE: print("Result: "+removeThese(["A","B","C","D","F","G"], ["B","C","A","f","F"]));//D,G
     * IMPORTANT: compares reference not value, create a similar method if you need to compare value
     */
    static func removeMany<T>(_ array:inout [T],_ many:[T]) -> [T] {
        many.forEach{
            let index:Int = ArrayParser.indx(array, $0)
            if(index != -1) {array.remove(at: index)}
        }
        return array
    }
    /**
     * NOTE: apple provides a native method aswell: [1,2,3].removeAll().count//0
     * EXAMPLE:
     * var arr = ["a","b","c","d","e","f","g","h","i","j"]
     * ArrayModifier.removeAll(arr).count//0
     */
    static func removeAll<T>(_ arr:inout [T])->[T]{
        arr.forEach{_ in
            arr.removeLast()/*using removeFirst() also works*/
        }
        return arr//why are we returning an empty arr?
    }
    /**
     * Returns PARAM: array with out the items in PARAM: these by the PARAM: key
     * EXAMPLE: print("result: " + ArrayParser.describe(removeTheseByKey([{name:"Alf"},{name:"Bert"},{name:"Bill"},{name:"John"},{name:"James"},{name:"Chuck"}], ["Bert","James","Chuck"], "name")));//Alf,Bill,John
     * IMPORTANT: Compares value not reference, if reference comparing is need then create another method for that case
     */
    static func removeManyByKey<T>(_ array:inout [[String:T]],_ many:[T],_ key:String) -> [[String:T]] where T:Comparable {
        var i:Int = 0
        while (i < array.count){//<--swift 3 support -> was simple c-style for loop
            let dict:[String:T] = array[i]
            let toMatch:T = dict[key]!
            if(ArrayParser.index(many, toMatch) != -1) {
                _ = array.splice2(i,1)
                i -= 1
            }
            i += 1
        }
        return array
    }
    /**
     * Randomnizes the order of an array
     * NOTE: Randomize vs randomise -> the later is the british spelling
     * NOTE: the array is returned for the sake of convenience
     */
    static func randomize<T>(_ array:inout [T] ) -> [T] {
        array.sort { Bool,arg  in
            return ( Int(arc4random()) * 2 ) * 2 - 1 > 0
        }
        return array
    }
    /**
     * Remove last, insert last, this is new it could go in the AdvanceArrayModifier class
     */
    static func pushPop<T>(_ array:inout [T],_ item:T)->[T]{
        _ = array.popLast()
        array.append(item)
        return array
    }
    /**
     * Merges Array instance PARAM: a into Array instance PARAM: b at index PARAM: i
     * ⚠️️ IMPORTANT: Alters PARAM: a and PARAM: b
     * RETURNS: The altered Array instance PARAM: a
     * var abc:Array = ["a","b","c"];
     * var def:Array = ["d","e","f"];
     * print(ArrayModifier.merge(abc, def, 2));//a,b,d,e,f,c// and the def array should now be empty
     * ⚠️️ implement native: arr.insert(contentsOf:at:) bellow
     */
    static func mergeInPlaceAt<T>(_ a:inout [T], _ b:inout [T], _ i:Int) -> [T] {
        if(i == 0) {
            while(b.count > 0) {
                _ = a.unshift(b.splice2(b.count-1,1)[0])// :TODO: if splice is faster than unshift then use splice
            }
        }else if(i == a.count) {
            while(b.count > 0) {
                _ = a.splice2(a.count,0,b.splice2(0,1))
            }
        }else {
            while(b.count > 0) {
                _ = a.splice2(i,0,b.splice2(b.count-1,1))
            }
        }
        return a
    }
    /**
     * Merges b into a at index (returns a for convenience)
     * ⚠️️ IMPORTANT: Alters PARAM: a
     * PARAM: a:Target array
     * PARAM: b: array to merged onto Target array (does not alter b)
     * PARAM: index: where on the targetArray should it merge on
     * NOTE: For a non optimized version go ahead and just use arrayA.splice(0, index).concat(arrayB,arrayA);
     * EXAMPLE: ArrayModifier.mergeAt([1,2,3], [4,5,6], 1)//[1, 4, 5, 6, 2, 3]
     * ⚠️️ implement native: arr.insert(contentsOf:at:) bellow
     */
    static func mergeAt<T>(_ a:inout [T], _ b:[T], _ index:Int) -> [T]{
        if(index == a.count) {a += b}/*if the index is at the end then inout concat the arrays*/
        else {_ = a.splice2(index, 0,b)}// :TODO: test if this is correct?
        return a
    }
    /**
     * Similar to mergeAt, but does not alter the original PARAM a
     * NOTE: Strictly speaking we should move this to ArrayParser, as it doesnt modify anything
     */
    static func combineAt<T>(_ a:[T], _ b:[T], _ index:Int) -> [T]{
        var a = a
        return mergeAt(&a, b, index)
    }
    /**
     * Splits an array in two pieces
     * RETURN: a Tuple with 2 arrays
     * EXAMPLE:
     * var arr = [1,2,3,4,5,6]
     * let newArr = ArrayModifier.split(&arr, 3)
     * Swift.print(newArr)//([1, 2, 3], [4, 5, 6])
     */
    static func split<T>(_ array:inout [T] ,_ index:Int) -> (a:[T],b:[T]) {
        let arrayB:[T] = array.splice2(index, array.count-index)//you can also do this with pop and unshift etc. But I think splice is faster, simpler
        let retVal:([T],[T]) = (array,arrayB)
        return retVal
    }
    /**
     * Split an array at integer, returns a new array with arrays in it of the split
     * EXAMPLE:
     * let arr = ["1","2","3","4","5","6"]
     * let newArr = ArrayModifier.splitAtEvery(arr,3)
     * Swift.print(newArr)//[["1", "2", "3"], ["4", "5", "6"]]
     */
    static func splitAtEvery<T>(_ array:[T] , _ every:Int = 1 ) -> [[T]] {
        var every = every
        let copy:[T] = array//Create a copy
        var list:[[T]] = []
        every = max(every, 1)//Force value to be 1 or more
        let len:Int = ceil((copy.count / every).float).int
        var i:Int = 0
        while (i < len){
            let a:Int = i * every
            let b:Int = min(a + every, copy.count)
            let split:[T] = copy.slice2(a, b)
            list.append(split)
            i += 1
        }
        return list
    }
    /**
     * Swap item position in an array
     */
    static func swap<T>(_ array:inout [T], _ item1:T, _ item2:T) {
        let index1:Int = ArrayParser.indx(array, item1)
        let index2:Int = ArrayParser.indx(array, item2)
        if(index1 != -1 && index2 != -1) {
            array[index1] = item2
            array[index2] = item1
        }
    }
    /**
     * Swaps two items in PARAM: vector at PARAM: index1 PARAM: index2
     * NOTE: there is also the ArrayModifier.move method which is similar (it similar but doesnt do a 2-way swap)
     */
    static func indexSwap<T>(_ array:inout [T],_ index1:Int,_ index2:Int) -> [T] {
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
    static func rangeDisplace<T>(_ array:inout [T],_ range:Range<Int>,_ index:Int) -> [T] {
        let splice:[T] = array.splice2(range.start,range.end-range.start)//<--You could probably use range.length here
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
    static func reverseRange<T>(_ vector:inout [T],_ range:Range<Int>) -> [T] {
        let head:[T] = vector.splice2(0,range.start)
        let tail:[T] = vector.splice2(range.end-range.start, vector.count - (range.end-range.start))
        let reversedVector:[T] = vector.reversed()
        return head.concat(reversedVector).concat(tail)
    }
    /**
     * Removes a range of items from rangeStart to rangeEnd
     * RETURN: the newly altered array
     */
    static func removeRange<T>(_ array:inout [T], _ rangeStart:Int, _ rangeEnd:Int) -> [T]{
        array.removeSubrange(rangeStart..<rangeEnd)/*was -> array.splice2(rangeStart, rangeEnd - rangeStart)*/
        return array
    }
    /**
     * Removes duplicates
     * NOTE: the following two lines may be more efficient try to factor them and see if they are good
     * EXAMPLE: var arr:Array = ["a","b","b","c","b","d","c"]
     * EXAMPLE: let arr:[String] = ["a","b","b","c","b","d","c"];var z:[String] = [] Swift.print(arr.forEach{if(z.index(of: $0) == nil) {z.append($0)}})//["a", "b", "c", "d"]
     */
    static func removeDuplicates<T>(_ array:[T]) -> [T] where T:Comparable{
        var result:[T] = []
        array.forEach{
            if(result.index(of: $0) == nil) {result.append($0)}//append if doesn't exists
        }
        return result
    }
    /**
     * We use a method instead of just a match:Equatable, that way we can add multiple match conditions 👌
     */
    static func removeDups<T>(_ arr:[T], _ condition:(_ a:T, _ b:T)->Bool)->[T]{
        var result:[T] = []
        arr.forEach{
            if(result.first($0, condition) == nil) {result.append($0)}//append if doesn't exists
        }
        return result
    }
    /**
     * Very simple numeric sorter
     * NOTE: you could also use some sort of bubble sort
     * NOTE: modifies the original array,returns the array (convenient)
     * TODO: You could possibly add support for Generics that can use the < and > and maybe add a boolean for forward / backward support?
     * EXAMPLE:
     * var arr:Array = [5,4,1,2,0]
     * ArrayModifier.numericSort(&arr)
     * Swift.print(arr)//0, 1, 2, 4, 5
     */
    static func numericSort(_ array:inout [Int]) -> [Int]{
        for i in 1..<array.count{
            var e:Int = i
            while(e > 0 && array[i] < array[e-1]){
                e -= 1
            }
            _ = ArrayModifier.displace(&array, i, e)
        }
        return array
    }
    /**
     * Replaces PARAM: searchFor with PARAM: replaceWith (the existing item is deleted)
     * NOTE: on pretext is that the item to search for must already exist in the array or else this method doesnt work
     * NOTE: this only works if the oldItem is already in the array, if there is a chance that its not this function probably doesnt work
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is important
     */
    static func replace<T>(_ array:inout [T], _ searchFor:T, _ replaceWith:T) -> Int {
        let index:Int = ArrayParser.indx(array, searchFor)
        array[index] = replaceWith
        return index
    }
    /**
     * TODO: Make it work even if the length of the array the_replacements is longer than the matches
     * IMPORTANT: Compares reference not value, create a similar method if value comparing is needed
     */
    static func replaceMany<T>(_ array:inout [T], _ matches:[T], _ replacments:[T]) -> [T]{
        for i in 0..<matches.count {
            let index:Int = ArrayParser.indx(array, matches[i])//finds index of reference
            if(index != -1){array[index] = replacments[i]}
        }
        return array
    }
    /**
     * Inserts "before" PARAM index (see examples bellow)
     * NOTE: Another way to think of it is that the index always becomes the index of the item in the array
     * RETURN: the mutated PARAM arr
     * EXAMPLE: ["a","b","c"].insert("x", 0)//x,a,b,c
     * EXAMPLE: ["a","b","c"].insert("x", 1)//a,x,b,c
     * EXAMPLE: ["a","b","c"].insert("x", 2)//q,b,x,c
     * EXAMPLE: ["a","b","c"].insert("x", 3)//a,b,c,x
     * NOTE: ArrayModifier.addAt does the same thing as this method
     */
    static func insertAt<T>(_ arr:inout [T], _ item:T, _ index:Int) -> [T]{
        arr.insert(item, at: index)
        return arr
    }
    /**
     * Removes the first item then adds an item to the end of the arr
     * [a,b,c].shiftAppend(d)//[b,c,d]
     * CAUTION: [0,0,0,0,5].avg//1 Sometimes you want this to result in 5. use [].filter{$0 != 0} to remove 0
     */
    static func shiftAppend<T>(_ arr:inout [T], _ item:T) -> [T]{
        _ = arr.shift()
        arr.append(item)
        return arr
    }
    /**
     * Note: Useful if you want to do inline appendation
     */
    static func append<T>(_ array:[T],_ item:T)->[T]{
        var array = array
        array.append(item)
        return array
    }
    
}
