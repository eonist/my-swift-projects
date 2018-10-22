
import UIKit
/**
 * let animator = TimeAnimator(duration:0.3,onChange:{/*animate stuff*/},onComplete:{/*anim completed*/})
 * animator.start()
 * EXAMPLE:
 *
 * let to = self.curX + 1
 * let animator = TimeAnimator(duration:0.3)
 * animator.tick = {
 *    Swift.print("animator.curCount:  \(animator.curCount)")
 *    Swift.print("animator.progress:  \(animator.progress)")
 *    self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
 *    self.frame.origin.x self.curX
 * }
 * animator.start()
 */
class TimeAnimator:SimpleTimer{
   static let fps:TimeInterval = 1/30/*1/30 is 30FPS 1/60 IS 60FPS*/
   var curCount:Int = 0
   var totalCount:Int {return Int(duration / interval)}
   var duration:TimeInterval /*in seconds*/
   var onComplete:() -> Void
   init(duration:TimeInterval, onChange:@escaping () -> Void = {Swift.print("TimerAnimator.onChange")}, onComplete:@escaping () -> Void = {Swift.print("TimerAnimator.onComplete")}) {
      self.duration = duration
      self.onComplete = onComplete
//      self.onChange = onChange
      super.init(interval: TimeAnimator.fps, repeats:true, onTick: onChange)
   }
   override func update() {
      if curCount >= totalCount {
         curCount = totalCount
         super.update()
         onComplete()
         stop()
      }else {
         super.update()
         curCount += 1
      }
   }
}
extension TimeAnimator {
   /**
    * Returns (0 to 1)
    */
   var progress:CGFloat {
      return CGFloat(curCount) / CGFloat(totalCount)
   }
   /**
    * Util method for interpolating between values
    */
   static func Interpolate(from:CGFloat, to:CGFloat, fraction:CGFloat) -> CGFloat{
      return fraction * (to - from) + from
   }
}
/**
 * EXAMPLE: SimpleTimer(interval: 3,repeats: true){print("tick")}.start()//ticks every 3 seconds
 * IMPORTANT: ⚠️️ @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * IMPORTANT: ⚠️️ because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 */
class SimpleTimer {
   typealias Tick = ()->Void
   var timer:Timer?
   var interval:TimeInterval /*in seconds*/
   var repeats:Bool
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
      if(timer != nil){timer!.invalidate()}
   }
   func reset(){
      self.stop()
      self.start()
   }
   /**
    * This method must be in the public or scope
    */
   @objc func update() {
      tick()
   }
}
