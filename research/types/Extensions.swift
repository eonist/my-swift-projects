/*
 Extensions in Swift
 Add methods and properties to existing types
 Doesn't require source code for the type
 Can be added to classes, structures and enumerations
 IMPORTANT: Extensions are global. Define them anywhere in the source code and they will adher to the type it extends
*/

//NOTE: Extensions can add new functionality to a type, but they cannot override existing functionality.
//NOTE: Extensions can overide functionality of another extensions

//NOTE: extensions are almost like prototypes in other languages
//example of an extension:
//import UIKit
extension String {
	func reversewords() -> String {
		let wordsArray = self.componentsSeparatedByString(" ")
		let reversedArray = wordsArray.reverse()
		var newString = ""
		for eachword in reversedArray {
			newString += eachword + " "
		}
		return newString
	}
}
var message = "I want to reverse all the words in this string"

func testing(){
    message.reversewords()
}

//Adding Constraints to Protocol Extensions: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID283


extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

func testin2(){
    3.repetitions({
        print("Hello!")
    })
    // Hello!
    // Hello!
    // Hello!
}



//Use trailing closure syntax to make the call more succinct:
func testing3(){
    3.repetitions {
        print("Goodbye!")
    }
    // Goodbye!
    // Goodbye!
    // Goodbye!
}


//if you want to extend a protocol and then use self in the extension then set the protocol to: IColor:class (this only works for classes, structures, use mutating infront of the method etc ee apple docs for this)


protocol Vehicle
{
    var numberOfWheels: Int {get}
    var color: UIColor {get set}

    mutating func changeColor()
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blueColor()

    mutating func changeColor() {
        color = UIColor.redColor()
    }
}