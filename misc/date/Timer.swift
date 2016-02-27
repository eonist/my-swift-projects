import CoreFoundation
import CoreGraphics
import Darwin
import Foundation

class Timer {
    var timer:NSTimer?
    init(_ interval:NSTimeInterval,){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onTimer:", userInfo: nil, repeats: false)
    }
}


/*init(_ timeInterval:NSTimeInterval,_ target:AnyObject,_ aSelector:ObjectiveC.Selector,_ userInfo:AnyObject?,_ repeats:Bool ){
super.init(timeInterval: timeInterval, target: target, selector: aSelector, userInfo: userInfo, repeats: repeats)
}*/