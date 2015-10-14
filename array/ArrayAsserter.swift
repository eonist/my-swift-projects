class ArrayAsserter {
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     */
    
    class func indexOfObj<T>(arr : [T],obj: T)->Int{
        if let index = arr.indexOf(obj) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
}