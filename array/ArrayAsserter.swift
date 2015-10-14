class ArrayAsserter {
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     */
    
    class func indexOfObj(){
        let array = ["Apples", "Peaches", "Plums"]
        
        if let index = array.indexOf("Peaches") {
            print("Found peaches at index \(index)")
        }
    }
}