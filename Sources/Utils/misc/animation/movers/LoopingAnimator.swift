import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * PARAM: duration: in seconds
 * PARAM: callBack: is the callback ref that is called on every "frame tick"
 */
class LoopingAnimator:Animator{
    var repeatCount:Int/*<--zero means infinite, not at the moment it seems*/
    var curRepeatCount:Int = 0
    init(_ animatable:AnimProxyKind, _ repeatCount:Int = 0,_ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:@escaping FrameTick, _ easing:@escaping EasingEquation = Linear.ease){
        self.repeatCount = repeatCount
        super.init(animatable, duration, from, to, callBack, easing)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        frameTick(val)/*call the FrameTick method*/
        if(currentFrameCount >= framesToEnd){
            self.currentFrameCount = 0/*reset*/
            if(curRepeatCount >= repeatCount){/*The loop ended*/
                curRepeatCount = 0/*reset*/
                stop()/*stop animation*/
                super.onEvent(AnimEvent(AnimEvent.completed,self))
            }
            curRepeatCount += 1
        }
        self.currentFrameCount += 1
    }
}
