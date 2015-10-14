class ArrayAsserter {
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     */
    
    class func indexOfObj(arr:Array<String>)->Int{
        if let index = arr.indexOf("Peaches") {
            print("Found peaches at index \(index)")
            return index
        }else{
            return -1
        }
    }
}