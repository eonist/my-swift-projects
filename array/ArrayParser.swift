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
}