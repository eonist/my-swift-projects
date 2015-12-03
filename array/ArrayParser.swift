class ArrayParser{
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     * NOTE: you can also do things like {$0 > 5} , {$0 == str}  etc
     * NOTE: this may also work: haystack.filter({$0 == needle}).count > 0
     */
    class func indexOfStr(arr:Array<String>,str:String)->Int{
        if let index = arr.indexOf(str) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     * Returns the index of @param value in @param arr
     */
    class func index<T : Equatable>(arr : [T], _ value:T)->Int{//the <T: Equatable> part ensures that the types can use the equal operator ==
        if let i = arr.indexOf(value) {
            return i
        }else{
            return -1//-1 indicates non was found
        }
    }
    /**
     * returns the index for item, -1 of none is found
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
     * @example: trace(ArrayParser.conditionSort([4,2,5,1,0,-1,22,3],function(a:Number, b:Number):Boolean{return a < b;}));// -1,0,0,1,2,3,4,5,22
     */
    class func conditionSort(array:Array,contition:Function):Array{
        var sortedArray:Array = [];
        for (var i : int = 0; i < array.length; i++) {
            var index:int = Utils.index(array[i], sortedArray,contition);/**/
            index > -1 ? sortedArray.splice(index, 1, array[i], sortedArray[index]) : sortedArray.push(array[i]);/*add the weightedStyle to index 0 of the sortedStyles array or weigthedStyle does not have priority append weightedStyle to the end of the array */
        }
        return sortedArray;
    }
}