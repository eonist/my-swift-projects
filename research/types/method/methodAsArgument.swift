func test(){
    var array:Array = ["a","c","b"]
    array.sortInPlace(>)
    /*
    
    not working
    
    array.sort({
        $0.name < $1.name
    })
    */
}

func doSomethingToNumber(aNumber: Int, thingToDo: (Int)->Int) -> Int {
    // we've received some function as a parameter, which we refer to as
    // 'thingToDo' inside this function.

    // call the function 'thingToDo' using 'aNumber', and return the result
    return thingToDo(aNumber);
}

