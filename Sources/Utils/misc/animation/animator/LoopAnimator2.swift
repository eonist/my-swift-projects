import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * NOTE: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * NOTE: we don't use structs as init values because structs look like this: SomeStruct(from:0...) bbut tupples + typealias looks simpler (from:0...) more like method args would
 * PARAM: duration: in seconds
 * PARAM: callBack: is the callback ref that is called on every "frame tick"
 */
class LoopAnimator2:Animator2{
    var repeatCount:Int /*<--zero means infinite, not at the moment it seems*/
    var curRepeatCount:Int = 0
    init(initValues:LoopAnimator2.InitLoopValues = LoopAnimator2.initLoopValues, easing:@escaping EasingEquation = Easing.linear.ease, closure: @escaping FrameTick = {_ in}) {
        self.repeatCount = initValues.repeatCount
        super.init(initValues: (initValues.duration,initValues.from,initValues.to), easing: easing, onFrame: closure)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrameTick(){
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        onFrame(val)/*call the FrameTick method*/
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
    typealias InitLoopValues = (duration:CGFloat,from:CGFloat,to:CGFloat,repeatCount:Int)/*Typalias signature for initValues*/
    static var initLoopValues:InitLoopValues = (duration:0.5,from:0,to:1,repeatCount:3)/*Default init values*/
}
