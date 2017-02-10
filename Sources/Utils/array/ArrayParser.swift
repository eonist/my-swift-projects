import Foundation
class ArrayParser{
    /**
     * NOTE: This method compares value not reference
     * NOTE: String class works with Comparable and not Equatable, Use this method when dealing with Strings
     * NOTE: you can also do things like {$0 > 5} , {$0 == str}  etc
     * NOTE: this may also work: haystack.filter({$0 == needle}).count > 0
     * NOTE: the multiple generig type could also be written like this: <T : protocol<Equatable, Comparable>>
     * IMPORTANT: If you want to compare String, int, CGFloat etc use this as is, 
     * IMPORTANT: if you want to compare custom classes, then you should compare reference or 
     * IMPORTANT: if you want to compare values then you must implement Equatable or COmparable in this class
     * EXAMPLE: ArrayParser.index(["abc","123","xyz","456"], "xyz")//2
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")//1
     */
    static func index<T>(_ array : [T], _ value:T)->Int where T:Equatable, T:Comparable{//the <T: Comparable> The Comparable protocol extends the Equatable protocol -> implement both of them
        if let i = array.index(of: value) {
            return i
        }else{
            return -1/*-1 indicates no item was found*/
        }
    }
    /**
     *
     */
    static func index(){
        
    }
    /**
     * New
     * NOTE: If you want to compare values rather than references. Then use the "==" compare operator and make sure you test if an instance is of String or Int or CGFloat etc. and then cast it to that type before you attempt to use the "==" operator. AnyObject in of it self cant be tested with the == operator. I can definitely see the use case for testing value rather than ref.
     * IMPORTANT: compares reference not value
     */
    static func indx<T>(_ arr: [T], _ item: T) -> Int{//<--use inout for both args?
        for i in 0 ..< arr.count{
            if((arr[i] as AnyObject) === (item as AnyObject)){return i}
        }
        return -1
    }
    /**
     * NOTE: I feel this is the best implementation as it doesn't copy anything, "direct comparison" with the inout args
     * NOTE: dupplets doesn't seem to be castable to AnyObject
     * NOTE: Compares reference not value
     */
    static func idx<T>(_ arr:inout [T], _ item:inout T) -> Int{
        for i in 0 ..< arr.count{
            if((arr[i] as AnyObject) === (item as AnyObject)){return i}//we cast to AnyObject because generics can't ref compare, but AnyObject can
        }
        return -1
    }
    /**
     * Returns the index of the first instance that matches the @param item in the @param arr, -1 of none is found
     * NOTE: works with AnyObject aswell. Unlike the apple provided array.indexOf that only works with Equatable items
     * IMPORTANT: This method only works with instances that are casted as AnyObject, use the indx method instead as it is cleaner
     * IMPORTANT: compares reference not value
     */
    static func indexOf(_ arr:Array<AnyObject>,_ item:AnyObject)-> Int{
        for i in 0 ..< arr.count{
            if(arr[i] === item){return i}
        }
        return -1
    }
    /**
     * Returns an array with itmes that are not the same in 2 arrays
     * EXAMPLE: difference([1,2,3],[1,2,3,4,5,6]);//4,5,6
     * IMPORTANT: compares value not reference (If you need support for ref
     */
    static func difference<T>(_ a:Array<T>, _ b:Array<T> )->Array<T> where T:Equatable, T:Comparable{
        var diff:Array<T> = []
        for item in a { if (ArrayParser.index(b,item) == -1) {diff.append(item)}}
        for item in b { if (ArrayParser.index(a,item) == -1) {diff.append(item)}}
        return diff
    }
    /**
     * Returns an array with itmes that are not the same in 2 arrays
     * EXAMPLE: difference([1,2,3],[1,2,3,4,5,6]);//4,5,6
     * IMPORTANT: compares reference not value
     */
    static func difference<T>(_ a:Array<T>, _ b:Array<T> )->Array<T> {
        var diff:Array<T> = []
        for item in a { if (ArrayParser.indx(b,item) == -1) {diff.append(item)}}
        for item in b { if (ArrayParser.indx(a,item) == -1) {diff.append(item)}}
        return diff
    }
    /**
     * EXAMPLE: similar([1, 2, 3, 10, 100],[1, 2, 3, 4, 5, 6])
     * NOTE: the orgiginal versio nof this method is a little different, it uses an indexOf call
     * IMPORTANT: this compares value similarity not reference, make a similar method if its needed for references aswell, or add some more logic to this method to support both. A bool flag can differentiate etc
     */
    static func similar<T:Equatable>(_ a:[T],_ b:[T])->[T]{//TODO:Add support for COmparable to this method
        var similarList:[T] = []
        for x in b {
            for y in a {
                if y == x {
                    similarList.append(y)
                    break
                }
            }
        }
        return similarList
    }  
    /**
     * Returns a list unique with all the unique Int from PARAM: ints
     * EXAMPLE: unique([1, 2, 3, 1, 2, 10, 100])//[1, 2, 3, 10, 100]
     */
    static func unique(_ ints:Array<Int>)->Array<Int>{//use comparable instead of int, see RangeAsserter for example for how to implement that
        var uniqueList:[Int] = []
        for number in ints {
            var numberIsNew = true
            for otherNumber in uniqueList {
                if number == otherNumber {
                    numberIsNew = false
                    break
                }
            }
            if numberIsNew {uniqueList.append(number)}
        }
        return uniqueList
    }
    /**
     * Returns the first item in an array
     * NOTE: there is also the native: [1,2,3].first//1
     */
    static func first<T>(_ arr:[T])->T{
        return arr[0]
    }
    /**
     * Returns the last item in an array
     * NOTE: there is also the native: [1,2,3].last//3
     */
    static func last<T>(_ arr:[T])->T{
        return arr[arr.count-1]
    }
    /**
     * Returns a new array with every item in @param array sorted according a custom method provided in @param contition
     * NOTE: leaves the original array intact
     * EXAMPLE: Print(ArrayParser.conditionSort([4,2,5,1,0,-1,22,3],<));// -1,0,1,2,3,4,5,22
     */
    static func conditionSort<T>(_ array:[T],_ condition: (_ a: T, _ b: T)->Bool)->Array<T>{
        var sortedArray:Array<T> = []
        for i in 0 ..< array.count{
            let index:Int = Utils.index(array[i], sortedArray, condition)
            if(index > -1){_ = ArrayModifier.splice2(&sortedArray,index, 1, [array[i],sortedArray[index]])}
            else{sortedArray.append(array[i])/*add the weightedStyle to index 0 of the sortedStyles array or weigthedStyle does not have priority append weightedStyle to the end of the array */}
        }
        return sortedArray
    }
    /**
     * Returns the first item in PARAM: array that is of PARAM: type
     */
    static func firstItemByType<T>(_ array:Array<Any?>, type:T.Type) -> T?{
        for item in array{ if (item as? T != nil) {return item as? T}}
        return nil
    }
    /**
     * Returns all items in PARAM: array that is of PARAM: type
     */
    static func itemsByType<T>(_ array:Array<Any?>, type:T.Type) -> Array<T>{
        var items:Array<T> = []
        for item in array{ if (item as? T != nil) {items.append(item as! T)}}
        return items
    }
    /**
     * Returns a random array with unique numbers (no duplicates)
     * EXAMPLE:
     * let ranArr = ArrayParser.uniqueRandom(0, 4)
     * print(ranArr)//[3, 1, 0, 4, 2]
     */
    static func uniqueRandom(_ start:Int, _ end:Int) -> Array<Int> {
        var numbers:Array<Int> = []
        for a in start...end{numbers.append(a)}
        var randomNumbers:Array<Int> = []
        let len:Int = numbers.count
        for e in 0..<len{
            let randomNr:Int = Int(arc4random_uniform(UInt32(len-e)))
            randomNumbers.append(numbers[randomNr])
            _ = numbers.splice2(randomNr, 1)
        }
        return randomNumbers
    }
    /**
     * IMPORTANT: Compares reference not value, if value comparing is needed then create another method to support that
     */
    static func occurences<T>(_ theList:Array<T>, theItem:T){
        var counter:Int = 0
        for i in 0..<theList.count{
            if((theList[i] as AnyObject) === (theItem as AnyObject)){counter += 1}
        }
    }
}
private class Utils{
    /**
     * Returns the index of the item in PARAM: sortedArray that meets the PARAM: condition method "true", if there is no item in the @param sortedArray meets the condition method "true" then return -1 (-1 means no match found)
     */
    static func index<T>(_ value:T, _ sortedArray:[T],_ condition:(_ a: T, _ b: T)->Bool)->Int{
        for i in 0..<sortedArray.count{
            if(condition(value,sortedArray[i])) {return i}
        }
        return -1
    }
}
