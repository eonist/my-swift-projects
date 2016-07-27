class ArrayParser{
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     * NOTE: you can also do things like {$0 > 5} , {$0 == str}  etc
     * NOTE: this may also work: haystack.filter({$0 == needle}).count > 0
     */
    class func indexOfStr(arr:Array<String>,_ str:String)->Int{
        if let index = arr.indexOf(str) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     * Returns the index of PARAM: val in PARAM: arr
     */
    class func index<T : Equatable>(arr : [T], _ val:T)->Int{//the <T: Equatable> part ensures that the types can use the equal operator ==
        if let i = arr.indexOf(val) {
            return i
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     * EXAMPLE: ArrayParser.index(["abc","123","xyz","456"], "xyz")//2
     */
    class func index<T : Comparable>(array : [T], _ value:T)->Int{//the <T: Comparable> The Comparable protocol extends the Equatable protocol -> implement both of them
        if let i = array.indexOf(value) {
            return i
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     * Returns the index for item, -1 of none is found
     * NOTE: keep this method around until the index method is tested
     */
    class func indexOfValue<T: Equatable>(array: [T], _ value: T) -> Int? {//the <T: Equatable> part ensures that the types can use the equal operator ==
        for (index, item) in array.enumerate() {
            if value == item {
                return index
            }
        }
        return -1
    }
    /**
     * Returns the index of the first obj that matches the @param item in the @param arr, -1 of none is found
     * NOTE: works with AnyObject aswell. Unlike the apple provided array.indexOf that only works with Equatable items
     */
    class func indexOf(arr:Array<AnyObject>,_ item:AnyObject)-> Int{
        for var i = 0; i < arr.count; ++i{
            if(arr[i] === item){return i}
        }
        return -1
    }   
    /**
     * New
     * NOTE: If you want to compare values rather than references. Then use the "==" compare operator and make sure you test if an instance is of String or Int or CGFloat etc. and then cast it to that type before you attempt to use the "==" operator. AnyObject in of it self cant be tested with the == operator. I can definitely see the use case for testing value rather than ref.
     */
    class func indx<T>(arr: [T], _ item: T) -> Int{
        for var i = 0; i < arr.count; ++i{
            if((arr[i] as! AnyObject) === (item as! AnyObject)){return i}
        }
        return -1
    }
    /**
     * Returns an array with itmes that are not the same in 2 arrays
     * @example: difference([1,2,3],[1,2,3,4,5,6]);//4,5,6
     */
    class func difference<T>(a:Array<T>, _ b:Array<T> )->Array<T> {
        var diff:Array<T> = []
        for item in a { if (ArrayParser.indx(b,item) == -1) {diff.append(item)}}
        for item in b { if (ArrayParser.indx(a,item) == -1) {diff.append(item)}}
        return diff
    }
    /**
     * EXAMPLE: similar([1, 2, 3, 10, 100],[1, 2, 3, 4, 5, 6])
     * NOTE: the orgiginal versio nof this method is a little different, it uses an indexOf call
     */
    class func similar<T:Equatable>(a:[T],_ b:[T])->[T]{
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
     * Returns a list unique with all the unique int from @param ints
     * unique([1, 2, 3, 1, 2, 10, 100])
     */
    class func unique(ints:Array<Int>)->Array<Int>{
        var uniqueList: [Int] = []
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
     */
    class func first<T>(arr:[T])->T{
        return arr[0]
    }
    /**
     * Returns the last item in an array
     */
    class func last<T>(arr:[T])->T{
        return arr[arr.count-1]
    }
    /**
     * Returns a new array with every item in @param array sorted according a custom method provided in @param contition
     * @Note: leaves the original array intact
     * @example: Print(ArrayParser.conditionSort([4,2,5,1,0,-1,22,3],<));// -1,0,0,1,2,3,4,5,22
     */
    class func conditionSort<T>(array:[T],_ condition: (a: T, b: T)->Bool)->Array<T>{
        var sortedArray:Array<T> = [];
        for (var i : Int = 0; i < array.count; i++) {
            let index:Int = Utils.index(array[i], sortedArray, condition);/**/
            if(index > -1){sortedArray = ArrayModifier.splice(&sortedArray,index, 1, [array[i],sortedArray[index]])}
            else{sortedArray.append(array[i]);/*add the weightedStyle to index 0 of the sortedStyles array or weigthedStyle does not have priority append weightedStyle to the end of the array */}
        }
        return sortedArray;
    }
}
private class Utils{
    /**
     * Returns the index of the item in @param sortedArray that meets the @param condition method "true", if there is no item in the @param sortedArray meets the condition method "true" then return -1 (-1 means no match found)
     */
    class func index<T>(value:T, _ sortedArray:[T],_ condition:(a: T, b: T)->Bool)->Int{
        for (var i : Int = 0; i < sortedArray.count; i++) {
            if(condition(a: value,b: sortedArray[i])) {return i}
        }
        return -1;
    }
}