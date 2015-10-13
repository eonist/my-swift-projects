//i dont think you should use type alias too much, but here is a good example: (I wonder what scope type alias works under)

typealias returnedFunctionType = (Int) -> String

func myFuncThatReturnsAFunc() -> returnedFunctionType {
    return { number in
        return "The lucky number is \(number)"
    }
}

let returnedFunction = myFuncThatReturnsAFunc()

func test(){
    returnedFunction(5) // The lucky number is 5
}
