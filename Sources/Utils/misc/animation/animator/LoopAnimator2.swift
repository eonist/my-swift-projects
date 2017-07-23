import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * PARAM: duration: in seconds
 * PARAM: callBack: is the callback ref that is called on every "frame tick"
 */
class LoopAnimator2:Animator2{
    var repeatCount:Int/*<--zero means infinite, not at the moment it seems*/
    var curRepeatCount:Int = 0
    init(initValues:Animator.InitValues, _ repeatCount:Int = 0, easing:@escaping EasingEquation = Easing.linear.ease, closure: @escaping FrameTick = {_ in}) {
        self.repeatCount = repeatCount
        super.init(initValues: initValues, easing: easing, closure: closure)
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
                completed()
            }
            curRepeatCount += 1
        }
        self.currentFrameCount += 1
    }
}
extension LoopAnimator2{
    struct InitValues2{
        var duration:CGFloat {get{return initValues.duration}set{initValues.duration = newValue}}/*In seconds*/
        var from:CGFloat {get{return initValues.from}set{initValues.from = newValue}}/*From this value*/
        var to:CGFloat {get{return initValues.to}set{initValues.to = newValue}}/*To this value*/
        var initValues:Animator2.InitValues2
        var repeatCount:Int
        init(duration:CGFloat,from:CGFloat,to:CGFloat,repeatCount:Int){
            self.initValues = Animator2.InitValues2(duration:duration,from:from,to:to)
            self.repeatCount = repeatCount
        }
    }
}
