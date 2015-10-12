import Foundation
//nstimer
/*
override func viewDidLoad() {
    super.viewDidLoad()

    var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update", userInfo: nil, repeats: true)
}
*/

// must be internal or public. 
func update() {
    // Something cool
}

//with param
var somethingToPass = "It worked"



//
//NSLog is available in Swift for logging to the system console. You use the same formatting syntax you would use in Objective-C.

func someMethod(){
    let π = M_PI//to get the π char -> alt + p
    NSLog("%.7f", π)
}
// Logs "3.1415927" to the console
//Swift also has print functions like print(_:) available. These functions are simple, powerful, and versatile due to Swift’s string interpolation. They don’t print to the system console but are available for general printing needs.

//NSAssert functions do not carry over to Swift. Instead, use the assert function.

