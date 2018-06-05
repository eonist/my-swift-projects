
import Foundation
/**
 * EXAMPLE: CountDownTimer.init(duration:5,interval:0.1).onComplete{Swift.print("5 seconds up")}
 */
class CountDownTimer:SimpleTimer{
    let duration:Double
    var onComplete:()->Void// = {Swift.print("default onComplete")}
    var curTime:Double = 0
    init(duration:Double, interval:Double,onTick:@escaping Tick, onComplete:@escaping() -> Void) {
        self.duration = duration
        self.onComplete = onComplete
        super.init(interval: interval, repeats:true, onTick: onTick)
    }
    /**
     * Called on every interval
     */
    override func update() {
        super.update()
        curTime += interval
        if curTime >= duration {
            onComplete()
            stop()
        }
    }
    /**
     * Always starts from 0
     */
    override func start() {
        curTime = 0
        super.start()
    }
    /**
     * Resumes at curTime
     */
    func resume(){
        super.start()
    }
}
