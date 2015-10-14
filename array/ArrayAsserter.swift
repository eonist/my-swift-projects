class ArrayAsserter {
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     * NOTE: you can also do things like {$0 > 5}
     */
    
    class func indexOfObj<T>(arr : [T],obj: T)->Int{
        if let index = arr.indexOf({$0 === obj}) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
}