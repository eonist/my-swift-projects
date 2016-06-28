import CoreFoundation
import CoreGraphics
import Darwin
import Foundation

class Timer {
    var timer:NSTimer?
    var interval:NSTimeInterval
    var repeats:Bool
    var target:AnyObject
    var selector:ObjectiveC.Selector
    
    init(_ interval:NSTimeInterval,_ repeats:Bool = false,_ target:AnyObject,_ selector:ObjectiveC.Selector){
        self.interval = interval
        self.repeats = repeats
        self.target = target
        self.selector = selector
    }
    /**
     *
     */
    func start(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: selector, userInfo: nil, repeats: repeats)
    }
    /**
     *
     */
    func stop(){
        if(timer != nil){timer!.invalidate()}
    }
}

/*init(_ timeInterval:NSTimeInterval,_ target:AnyObject,_ aSelector:ObjectiveC.Selector,_ userInfo:AnyObject?,_ repeats:Bool ){
super.init(timeInterval: timeInterval, target: target, selector: aSelector, userInfo: userInfo, repeats: repeats)
}*/