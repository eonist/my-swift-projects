import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * PARAM: duration: in seconds
 * PARAM: callBack: is the callback ref that is called on every "frame tick"
 */
class LoopingAnimator:Animator{
    var repeatCount:Int/*<--zero means infinite*/
    var curRepeatCount:Int = 0
    //swift 3 update: @escaping was added
    init(_ animatable:IAnimatable, _ repeatCount:Int = 0,_ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:@escaping (CGFloat)->Void, _ easing:@escaping (CGFloat,CGFloat,CGFloat,CGFloat)->CGFloat = Linear.easeLinear){
        self.repeatCount = repeatCount
        super.init(animatable, duration, from, to, callBack, easing)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        //Swift.print("onFrame()")
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        //Swift.print("val: " + "\(val)")
        callBack(val)//call the callBack method
        if(currentFrameCount >= framesToEnd){
            //Swift.print("end of anim")/*when the count becomes 0 the frame ticker stops*/
            self.currentFrameCount = 0//<--reset
            if(curRepeatCount >= repeatCount){/*The loop ended*/
                curRepeatCount = 0//<--reset
                stop()//<--stop animation
                super.onEvent(AnimEvent(AnimEvent.completed,self))
            }
            curRepeatCount += 1
        }
        self.currentFrameCount += 1
    }
}
