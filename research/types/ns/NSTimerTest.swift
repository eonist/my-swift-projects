import Foundation
//untested but looks good
class Testing {
    
    var timer:NSTimer?
    func test(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "tester:", userInfo: somethingToPass, repeats: false)
    }
    
    func tester(timer: NSTimer){
        let theStringToPrint = timer.userInfo as! String
        print(theStringToPrint)
    }
}