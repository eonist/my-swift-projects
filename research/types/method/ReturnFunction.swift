//“Functions can also return other functions. This means that you can use a function that creates a new function, which you can use in your code:”
func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    return adder
}
var addTwo = createAdder(2)
addTwo(2) // = 4
