import Foundation
/**
 * EXAMPLE: SimpleTimer(interval: 3,repeats: true){print("tick")}.start()//ticks every 3 seconds
 * IMPORTANT: ⚠️️ @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * IMPORTANT: ⚠️️ because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 */
class SimpleTimer {
    typealias Tick = ()->Void
    private var timer:Timer?
    var interval:TimeInterval /*in seconds*/
    private var repeats:Bool
    var tick:Tick
    
    init( interval:TimeInterval, repeats:Bool = false, onTick:@escaping Tick){
        self.interval = interval
        self.repeats = repeats
        self.tick = onTick
    }
    func start(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(update), userInfo: nil, repeats: true)//swift 3 upgrade
    }
    func stop(){
        if let timer = timer {timer.invalidate()}
    }
    func reset(){
        stop()
        start()
    }
    /**
     * This method must be in the public or scope
     */
    @objc func update() {
        tick()
    }
}
