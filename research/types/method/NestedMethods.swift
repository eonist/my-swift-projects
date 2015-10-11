func myFunctionWithNumber(someNumber: Int) {

    func increment(var someNumber: Int) -> Int {
        return someNumber + 10
    }

    let incrementedNumber = increment(someNumber)
    println("The incremented number is \(incrementedNumber)")
}

myFunctionWithNumber(5)
// The incremented number is 15