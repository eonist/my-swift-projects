
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
