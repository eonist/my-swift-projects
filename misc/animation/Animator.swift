import Cocoa
/**
 * TODO: You can store the active animator instance count in the AnimatableView to know when to stop the cvdisplaylink
 * TODO: take a look at other animation libs
 * TODO: Add onComplete selector callback method on init and as a variable, do the same with method, use optional to assert if they exist or not
 * TODO: seek,reverse,repeate,autoRepeat
 * TODO: Implement a way so that the animator can be reused so that you can target it and disable it
 */
class Animator:BaseAnimation{
    let fps:CGFloat = 60//<--TODO: this should be derived from a device variable
    var duration:CGFloat/*in seconds*/
    var from:CGFloat/*from this value*/
    var to:CGFloat/*to this value*/
    var callBack:(CGFloat)->Void//the closure method that changes the property, you can use a var closure or a regular method, probably even an inline closure
    var framesToEnd:CGFloat//totFrameCount
    var currentFrameCount:CGFloat = 0//curFrameCount
    var easing:(CGFloat,CGFloat,CGFloat,CGFloat)->CGFloat//variable for holding the easing method
    //isActive used by the AnimatiableView to assert if an animator is active or not
    init(_ animatable:IAnimatable, _ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:(CGFloat)->Void, _ easing:(CGFloat,CGFloat,CGFloat,CGFloat)->CGFloat = Easing.easeLinear){
        self.duration = duration
        self.from = from
        self.to = to
        self.callBack = callBack
        self.easing = easing
        framesToEnd = fps * duration
        super.init(animatable)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        //Swift.print("onFrame()")
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        //Swift.print("val: " + "\(val)")
        callBack(val)//call the property method
        if(currentFrameCount == framesToEnd){
            //Swift.print("end of anim")/*when the count becomes 0 the frame ticker stops*/
            stop()
            super.onEvent(AnimEvent(AnimEvent.completed,self))
        }
        self.currentFrameCount++
    }
}