//“A function can also “capture” a value, and use it multiple times. This is a tricky concept, so we’ll go into it in a bit of detail. Consider the following example code:”

//“The amount variable is not shared between individual functions, however. When a new incrementor is created, it has its own separate amount variable.”



func createIncrementor(incrementAmount: Int) -> () -> Int {  
    var amount = 0  
    func incrementor() -> Int {  
        amount += incrementAmount  
        return amount
    }
    return incrementor  
}

var incrementByTen = createIncrementor(10)  
incrementByTen() // = 10 
incrementByTen() // = 20

var incrementByFifteen = createIncrementor(15)  
incrementByFifteen() // = 15 
