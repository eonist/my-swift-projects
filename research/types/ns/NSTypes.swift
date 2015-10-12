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

class Testing {
    func init(){
    
    }
    let timer:NSTimer?
    func test(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "tester:", userInfo: somethingToPass, repeats: false)
    }
    
    
    func tester(timer: NSTimer){
        let theStringToPrint = timer.userInfo as String
        println(theStringToPrint)
    }
}

//
//NSLog is available in Swift for logging to the system console. You use the same formatting syntax you would use in Objective-C.

NSLog("%.7f", pi)
// Logs "3.1415927" to the console
//Swift also has print functions like print(_:) available. These functions are simple, powerful, and versatile due to Swift’s string interpolation. They don’t print to the system console but are available for general printing needs.

//NSAssert functions do not carry over to Swift. Instead, use the assert function.

