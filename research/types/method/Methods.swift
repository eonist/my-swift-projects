//priv,internal,public :https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html#//apple_ref/doc/uid/TP40014097-CH41-ID3

func someFunction(name:String,var key:String)->String{//params are constant by default, to make the mutable add the var infront of the param
	//doSomething
	key = key + "c"
	print("hello,"+someText)
	return key;
}
func testing(){
    someFunction("test",key: "ab")
}

//NOTE: can params have default values? yes but you must name them
//some()
//some(data:"testing")

class MethodTest{//pass a method via a para and execute it 
	let someMethod = {
		print("your value: something")
	}
	
	func anotherMethod( theMethod : ()->() ){
		for _ in 0...5 {
			theMethod()//performs this method 5 times
		}
	}
    //anotherMethod(someMethod)
	//anotherMethod({printin("hello")})//hello 5 times
}


//closure method passed to the sort method of swift:
func lowestToHighest(a:Int,b:Int)->Bool{
    return a < b;
}
//Nd then we convert this to a clouser method:
let lowToHigh = {(a:Int,b:Int)->Bool in
    return a < b;
}

var someInts:[Int] = [500,63,99,23]
//var sortedInts:[Int] = sorted(lowToHigh)//sorts the ints

//method overloading:
// square function with Int argument
func square(value: Int) -> Int{
    print("Called square with Int argument: \(value)")
    return value * value
}


// square function with Double argument
func square(value: Double) -> Double{
    print("Called square with Double argument: \(value)")
    return value * value
}
// test overloaded square functions
func test(){
    print("Square of Int 7 is \(square(7))\n")
    print("Square of Double 7.5 is \(square(7.5))")
}


//external named parameters in a function:
// use iteration to calculate power of base raised to the exponent
func power(myBase base:Int, exponent:Int) -> Int {
    var result = 1;
    for _ in 1...exponent {
        result *= base
    }
    return result
}
func test2(){
    print("power(base: 10, exponent: 2) = \(power(myBase: 1, exponent: 2))")
    print("power(base: 2, exponent: 10) = \(power(myBase:2, exponent: 10))")

}
/**
* using external named parameter for the second param
func raiseBase(base: Int, #toExponent: Int) -> Int
raiseBase(18, toExponent: 2)
reads almost like a sentence:
Raise the base 1o to the exponent 2

*/





/**
* modifying a value passed in an param:
*/

// square function that modifies its argument in the caller
func square(inout value: Int) {//inout prefix enables the param to be edited directly
    value >= value // squares value of caller's variable
}
// test inout parameter
func test3(){
    var x = 5
    print("0riginal value of x is \(x)")
    square(&x)//<-- you have to explicity add the &, to verify that you know the value will be changed
}

//undefined num of params in a method:
// calculate average
func average(numbers: Double...) -> Double {
    let total = numbers.reduce(0.0, combine: {$0 + $1})
    return total / Double(numbers.count)
}



//in out example (modifies the original params)

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
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

//public getter but private setter:
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}


// the access level for the numberOfEdits property is marked with a private(set) modifier to indicate that the property should be settable only from within the same source file as the TrackedString structure’s definition. The property’s getter still has the default access level of internal, but its setter is now private to the source file in which TrackedString is defined
//This modification tracking is implemented with a didSet property observer on the value property, which increments numberOfEdits every time the value property is set to a new value.


//You can make the structure’s numberOfEdits property getter public, and its property setter private, by combining the public and private(set) access level modifiers:

public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}


//Variadic Parameters

//A variadic parameter accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write variadic parameters by inserting three period characters (...) after the parameter’s type name.

//The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type. For example, a variadic parameter with a name of numbers and a type of Double... is made available within the function’s body as a constant array called numbers of type [Double].

//The example below calculates the arithmetic mean (also known as the average) for a list of numbers of any length

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
func test4(){
    arithmeticMean(1, 2, 3, 4, 5)
    // returns 3.0, which is the arithmetic mean of these five numbers
    arithmeticMean(3, 8.25, 18.75)
    // returns 10.0, which is the arithmetic mean of these three numbers
}



//Constant and Variable Parameters

/*
Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake.

However, sometimes it is useful for a function to have a variable copy of a parameter’s value to work with. You can avoid defining a new variable yourself within the function by specifying one or more parameters as variable parameters instead. Variable parameters are available as variables rather than as constants, and give a new modifiable copy of the parameter’s value for your function to work with.

Define variable parameters by prefixing the parameter name with the var keyword:
*/


func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"






/*
This example defines a new function called alignRight(_:totalLength:pad:), which aligns an input string to the right edge of a longer output string. Any space on the left is filled with a specified padding character. In this example, the string "hello" is converted to the string "-----hello".

The alignRight(_:totalLength:pad:) function defines the input parameter string to be a variable parameter. This means that string is now available as a local variable, initialized with the passed-in string value, and can be manipulated within the body of the function.

The function starts by working out how many characters need to be added to the left of string in order to right-align it within the overall string. This value is stored in a local constant called amountToPad. If no padding is needed (that is, if amountToPad is less than 1), the function simply returns the input value of string without any padding.

Otherwise, the function creates a new temporary String constant called padString, initialized with the pad character, and adds amountToPad copies of padString to the left of the existing string. (A String value cannot be added on to a Character value, and so the padString constant is used to ensure that both sides of the + operator are String values.)

*/

//NOTE: The changes you make to a variable parameter do not persist beyond the end of each call to the function, and are not visible outside the function’s body. The variable parameter only exists for the lifetime of that function call.









