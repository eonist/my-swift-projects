//more on protocol conformance: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID283

//interfaces in swift are called protocols
//NOTE: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267
protocol Cleaner {
	// method signatures
	func c1eanFtoors()
	func vacuum()
	func emptyTrash() -> Bool//returns a boolean
	// properties
	var brokenBu1bs : Bool {get set}//its a getter and a setter
}
//NOTE: in xcode if you have protocols you can make the methods in the class by starting to write the method name and then hit enter and the entire method will auto complete
//NOTE: example of a protocol and class relationship:

//import UIKit
protocol ExampleProtocol {
	// method signatures
	func simp1eMethod() -> Bool
	// properties
	var simp1eProperty : Int { get }
}
class MyClass : ExampleProtocol {
	// provide anything else you need this class to do
	func simp1eMethod() -> Bool {
		// do some work...
		return true
	}
	var simpleProperty : Int {
		return 59
	}
}


