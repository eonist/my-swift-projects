import CoreFoundation
import CoreGraphics
import Darwin
import Foundation
/**
 * NOTE: Set a NSDate to measure the time like this: var startTime:NSDate = NSDate();abs(startTime!.timeIntervalSinceNow) 
 * NOTE: Or easier: let d = CACurrentMediaTime(); /*Do heavy computing*/let d1 = CACurrentMediaTime()-d; print(d1)//0.452 sec
 * EXAMPLE:
 * let timer = SimpleTimer(0.5,true,callBack)
 * timer.start()
 * @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * IMPORTANT: because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 */
class SimpleTimer {/*was named Timer, but since swift 3, NSTimer is now Timer*/
    typealias Tick = ()->Void
    var timer:Timer?
    var interval:TimeInterval
    var repeats:Bool
    var tick:Tick
    
    init( interval:TimeInterval, repeats:Bool = false, onTick:@escaping Tick){/*, target:AnyObject*//*, selector:ObjectiveC.Selector*/
        self.interval = interval
        self.repeats = repeats
        self.tick = onTick
    }
    func start(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(update), userInfo: nil, repeats: true)//swift 3 upgrade
    }
    func stop(){
        if(timer != nil){timer!.invalidate()}
    }
    @objc func update() {//method must be in the public or scope
        Swift.print("tick")
        tick()
    }
}
