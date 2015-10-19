class ArrayParser{
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
     * Returns the index of @param value in @param arr
     */
    class func index<T : Equatable>(arr : [T], _ value:T)->Int{
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
     * TODO: upgrade to support any type T
     */
    class func similar(a:Array<Int>,b:Array<Int>)->Array<Int>{
        var similarList:Array<Int> = []
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
}