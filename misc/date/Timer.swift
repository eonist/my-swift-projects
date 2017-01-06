import CoreFoundation
import CoreGraphics
import Darwin
import Foundation
/**
 * NOTE: Set a NSDate to measure the time like this: var startTime:NSDate = NSDate();abs(startTime!.timeIntervalSinceNow) 
 * EXAMPLE: var timer = Timer(0.5,true,self,"update")
 * timer!.start()
 * func update() {Swift.print("tick")}//method must be in the public or scope
 */
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
        timer = NSTimer.scheduledTimerWithTimeInterval(interval/*0.01*/, target: target, selector: selector, userInfo: nil, repeats: repeats)
    }
    /**
     *
     */
    func stop(){
        if(timer != nil){timer!.invalidate()}
    }
}

/*
init(_ timeInterval:NSTimeInterval,_ target:AnyObject,_ aSelector:ObjectiveC.Selector,_ userInfo:AnyObject?,_ repeats:Bool ){
    super.init(timeInterval: timeInterval, target: target, selector: aSelector, userInfo: userInfo, repeats: repeats)
}
*/