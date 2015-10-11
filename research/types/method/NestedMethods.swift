func myFunctionWithNumber(someNumber: Int) {

    func increment(var someNumber: Int) -> Int {
        return someNumber + 10
    }

    let incrementedNumber = increment(someNumber)
    println("The incremented number is \(incrementedNumber)")
}

myFunctionWithNumber(5)
// The incremented number is 15


//Nested Functions
//Nested functions cannot be referenced outside of their parent function.
func summer(var num: Double) -> (Double...) -> Double {
    // Closure: the nested function is able to close over `num`.
    func internalFunc (numbers: Double...) -> Double {
        for i in numbers {
            num += i
        }
        return num
    }

    return internalFunc
}

summer(1.0)(2.0, 3.0)              // 6.0