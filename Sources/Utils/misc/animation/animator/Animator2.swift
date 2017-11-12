import Foundation

/**
 * NOTE: Remember this needs to support many different animators and also simultan animations, so it cant be too intertwined
 * TODO: ⚠️️ make FrameAnimator2 that does not extend EventSender
 * TODO: ⚠️️ LoopAnimator2
 * TODO: ⚠️️ If you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 * TODO: ⚠️️ Later you can maybe create a class that is called AnimSeq, which can sequence anim from a json file, akin to your legacy project
 * TODO: ⚠️️ API like: spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {}  
 * TODO: ⚠️️ API like: animate(view, duration: 1, curve: .bezier(1, 0.4, 1, 0.5)) {$0.x = finalValue}
 */
class Animator2:FrameAnimator2 {
    var onFrame:FrameTick
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is needed in order to know when the animation is complete*/
    var initValues:InitValues
    var easing:EasingEquation/*Variable for holding the easing method*/
    var completed:Completed = {}
    //TODO: ⚠️️Make a struct for the initValues instead, because: autocomplete
    init(initValues:Animator2.InitValues = Animator2.initValues, easing:@escaping EasingEquation = Easing.linear.ease, onFrame: @escaping FrameTick = {_ in}) {
        self.initValues = initValues
        self.onFrame = onFrame
        self.easing = easing
        super.init(AnimProxy2.shared)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrameTick(){
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        onFrame(val)/*Call the callBack onFrame method*/
        if(currentFrameCount == framesToEnd){
            stop()/*Stop the animation*/
            //_ = completed(Animator.initValues, {_ in})//the animation completed, call the completed closure
            completed()
        }
        self.currentFrameCount += 1
    }
    /**
     * NOTE: we need onComplete in addition to complete because complete can't return self, so chaining won't work
     */
    func onComplete(closure: @escaping Completed) -> Self{
        completed = closure//assign the closure
        return self
    }
}

extension Animator2 {
    typealias Completed = () -> Void
    typealias InitValues = (dur:CGFloat,from:CGFloat,to:CGFloat)/*Signature for initValues*/
    static var initValues:InitValues = (dur:0.5,from:0,to:1)/*Default init values*/
    static var fps:CGFloat = 60//<--TODO: ⚠️️ this should be derived from a device variable
    var duration:CGFloat {get{return initValues.dur}set{initValues.dur = newValue}}/*In seconds*/
    var from:CGFloat {get{return initValues.from}set{initValues.from = newValue}}/*From this value*/
    var to:CGFloat {get{return initValues.to}set{initValues.to = newValue}}/*To this value*/
    var framesToEnd:CGFloat {return Animator.fps * duration}/*totFrameCount*/
}
//extension Animator2{
//    struct InitValues2{
//        var duration:CGFloat
//        var from:CGFloat
//        var to:CGFloat
//    }
//}
