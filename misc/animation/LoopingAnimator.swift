import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * PARAM: duration: in seconds
 * PARAM: callBack: is the callback ref that is called on every "frame tick"
 */
class LoopingAnimator:Animator{
    var repeatCount:Int//<--zero means infinite
    var curCount:Int = 0
    init(_ animatable:IAnimatable, _ repeatCount:Int = 0,_ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:(CGFloat)->Void, _ easing:(CGFloat,CGFloat,CGFloat,CGFloat)->CGFloat = Easing.easeLinear){
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
        method(val)//call the property method
        if(currentFrameCount == framesToEnd){
            //Swift.print("end of anim")/*when the count becomes 0 the frame ticker stops*/
            self.currentFrameCount = 0//<--reset
            if(curCount == repeatCount){/*The loop ended*/
                stop()//<--stop animation
                super.onEvent(AnimEvent(AnimEvent.completed,self))
            }
            curCount++
        }
        self.currentFrameCount++
    }
}
