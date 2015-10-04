 /**
  * public static constant methods and properties:
  */
 class StringUtil{
 	class var STRING_UTIL_NAME = "string util"//this is what is typically refered to as a public staic constant in other languages and is accessible from the class it self, not instances of it
 	/**
 	 * Returns a list of text items by splitting a text at every delimiter
	 */
	class func split(string, delimiter)->Array{
		return string.componentsSeperatedByString(delimiter)
	}
	/**
 	* NOTE: you cant access instance level variables when using public static constants
	 */
	class func name(){
		return STRING_UTIL_NAME
	}
 }
StringUtil.name//string util
StringUtil.split("abc 123"," ")[0]//"123"

//mutating:n (like implicit  setter in other languages, only for structs)

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// prints "The point is now at (3.0, 4.0)"

//Assigning to self Within a Mutating Method

//Mutating methods can assign an entirely new instance to the implicit self property. The Point example shown above could have been written in the following way instead:

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
