import Cocoa
/**
 * This class animates something from A to B with a easing curve attached
 * NOTE: This animation class is more like stock animation, less interuptable than "physics based animation"
 * TODO: ⚠️️ Take a look at other animation libs 👈
 * TODO: ⚠️️ Add onComplete selector callback method on init and as a variable, do the same with method, use optional to assert if they exist or not
 * TODO: ⚠️️ seek,reverse,repeate,autoRepeat
 */
class Animator:FrameAnimator {
    var frameTick:FrameTick/*The closure method that is called on every "frame-tick" and that changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is need in order to know when the animation is complete*/
    var easing:EasingEquation/*Variable for holding the easing method*/
    var initValues:InitValues/*Stores the intial config values for the animation, duration,fromValue, toValue*/
    init(onFrame:@escaping FrameTick = {_ in}, initValues:InitValues = Animator.initValues, easing:@escaping EasingEquation = Easing.linear.ease){
        self.frameTick = onFrame
        self.initValues = initValues
        self.easing = easing
        super.init(AnimProxy.shared)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        frameTick(val)/*Call the callBack onFrame method*/
        if(currentFrameCount == framesToEnd){
            stop()/*Stop the animation*/
            super.onEvent(AnimEvent(AnimEvent.completed,self))/*Notify listeners that the animation completed*/
        }
        self.currentFrameCount += 1
    }
    /*DEPRECATED*/
    init(_ animatable:AnimProxyKind, _ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:@escaping FrameTick, _ easing:@escaping EasingEquation = Linear.ease){
        initValues = (duration:duration,from:from,to:to)
        self.frameTick = callBack
        self.easing = easing
        super.init(animatable)
    }
}
