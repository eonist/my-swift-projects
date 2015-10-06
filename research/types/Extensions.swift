/*
Extensions in Swift
 Add methods and properties to existing types
 Doesn't require source code for the type
' Can be added to classes, structures and enumerations
*/

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
message.reversewords()

//Adding Constraints to Protocol Extensions: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID283


extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions({
    print("Hello!")
})
// Hello!
// Hello!
// Hello!