//priv,internal,public :https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html#//apple_ref/doc/uid/TP40014097-CH41-ID3

func someFunction(name:String,var key:String)->String{//params are constant by default, to make the mutable add the var infront of the param
	//doSomething
	key = key + "c"
	printin("hello, \(someText)")
	return key;
}
someFunction("test","ab")

//NOTE: can params have default values? yes but you must name them
some()
some(data:"testing")

class MethodTest{//pass a method via a para and execute it 
	let someMethod = {
		printin("your value: something")
	}
	
	func anotherMethod( theMethod : ()->() ){
		for i in 0...5 {
			theMethod()//performs this method 5 times
		}
	}
	anotherMethod(someMethod)
	anotherMethod({printin("hello")})//hello 5 times
}

//closure method passed to the sort method of swift:
func lowestToHighest(a:Int,b:Int)->Bool{
	return a < b;
}
//Nd then we convert this to a clouser method:
let lowToHigh{(a:Int,b:Int)->Bool in
	return a < b;
}

var someInts:[Int] = [500,63,99,23]
var sortedInts:[Int] = sorted(lowToHig)//sorts the ints

//method overloading:
// square function with Int argument
func square(value: Int) -> Int{
	println("Called square with Int argument: \(value)")
	return value * value
}
// square function with Double argument
func square(value: Double) -> Double{
	println("Called square with Double argument: \(value)")
	return value * value
}
// test overloaded square functions
println("Square of Int 7 is \(square(7))\n")
println("Square of Double 7.5 is \(square(7.5))")


//external named parameters in a function: 
// use iteration to calculate power of base raised to the exponent
func power(myBase base: Int, #exponents Int) -> Int {
	var result = 1;
	for i in 1...exponent {
		result *= base
	}
	return result
}
println("power(base: 10, exponent: 2) = \(power(myBase: 1, exponent: 2))")
println("power(base: 2, exponent: 10) = \(power(base: 2, exponent: 10))")

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
var x : 5
println("0riginal value of x is \(x)")
square(&x)//<-- you have to explicity add the &, to verify that you know the value will be changed

//undefined num of params in a method:
// calculate average
func average(numbers: Double..-) -> Double {
	var total = numbers.reduce(0.0, {$0 + $1})
	return total / Doub1e(numbers.count)	
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
 }
 // the access level for the numberOfEdits property is marked with a private(set) modifier to indicate that the property should be settable only from within the same source file as the TrackedString structure’s definition. The property’s getter still has the default access level of internal, but its setter is now private to the source file in which TrackedString is defined
 //This modification tracking is implemented with a didSet property observer on the value property, which increments numberOfEdits every time the value property is set to a new value.
 
 
 //You can make the structure’s numberOfEdits property getter public, and its property setter private, by combining the public and private(set) access level modifiers:
 
 public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}
