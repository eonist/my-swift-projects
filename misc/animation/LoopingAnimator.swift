import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 */
class LoopingAnimator:Animator{
    var repeatCount:Int//<--zero means infinite
    var curCount:Int = 0
    init(_ view:IAnimatable, _ repeatCount:Int = 0,_ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ method:(CGFloat)->Void, _ easing:(CGFloat,CGFloat,CGFloat,CGFloat)->CGFloat = Easing.easeLinear){
        self.repeatCount = repeatCount
        super.init(view, duration, from, to, method, easing)
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
            if(curCount == repeatCount){
                stop()//<--stop animation
            }
            curCount++
        }
        self.currentFrameCount++
    }
}
