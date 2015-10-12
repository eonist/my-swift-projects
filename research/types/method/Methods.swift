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
var sortedInts:[Int] = sorted(lowestToHighest)//sorts the ints

//method overloading:
// square function with Int argument
func square(value: Int) -> Int{
    println("Called square with Int argument: \(value)")
    return value * value
}