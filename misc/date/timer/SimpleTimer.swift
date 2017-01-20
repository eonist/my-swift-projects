import CoreFoundation
import CoreGraphics
import Darwin
import Foundation
/**
 * NOTE: Set a NSDate to measure the time like this: var startTime:NSDate = NSDate();abs(startTime!.timeIntervalSinceNow) 
 * EXAMPLE:
 * let timer = SimpleTimer(0.5,true,self,#selector(update))
 * timer.start()
 * @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * IMPORTANT: because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 */
class SimpleTimer {//was named Timer, but since swift 3, NSTimer is now Timer
    var timer:Timer?
    var interval:TimeInterval
    var repeats:Bool
    var target:AnyObject
    var selector:ObjectiveC.Selector
    
    init(_ interval:TimeInterval,_ repeats:Bool = false,_ target:AnyObject,_ selector:ObjectiveC.Selector){
        self.interval = interval
        self.repeats = repeats
        self.target = target
        self.selector = selector
    }
    /**
     *
     */
    func start(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: target, selector: selector, userInfo: nil, repeats: true)//swift 3 upgrade
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
