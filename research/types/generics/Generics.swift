//Generics
//NOTE: generics are better than using any or anyobject in that they keep the type that was passed to them
//greate example: http://www.thomashanning.com/swift-generics/

class TestClass {
	var singleProperty : String = "A string"
}
let myInts  = [123,456,789,345,678,234]
let myStrings = ["red","green","blue"]
let myobjects = [TestClass(),TestClass(),TestClass()]
func displayArray<T>(theArray : [T]) -> T {
	print("Printing the array:")
	for eachitem in theArray {
		print(eachitem)
		print("  :  ")
	}
	print("")
	let finalElement : T = theArray[theArray.count-1]
	return finalElement
}
var finalInt = displayArray(myInts)
//print(finalInt)
var finalString = displayArray(myStrings)
//print(finalString.uppercaseString)








/*
You may have noticed that the bodies of the swapTwoInts(_:_:), swapTwoStrings(_:_:), and swapTwoDoubles(_:_:) functions are identical. The only difference is the type of the values that they accept (Int, String, and Double).

It would be much more useful, and considerably more flexible, to write a single function that could swap two values of any type. Generic code enables you to write such a function. (A generic version of these functions is defined below.)

NOTE

In all three functions, it is important that the types of a and b are defined to be the same as each other. If a and b were not of the same type, it would not be possible to swap their values. Swift is a type-safe language, and does not allow (for example) a variable of type String and a variable of type Double to swap values with each other. Attempting to do so would be reported as a compile-time error.

Generic Functions

Generic functions can work with any type. Here’s a generic version of the swapTwoInts(_:_:) function from above, called swapTwoValues(_:_:):
*/

func swapTwoStrings(inout a: String, inout _ b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
 
func swapTwoDoubles(inout a: Double, inout _ b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}