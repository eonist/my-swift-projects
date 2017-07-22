import Foundation
@testable import Utils

/**
 * NOTE: remember this needs to support many different animators and also simultan animations, so it cant be too intertwined
 * TODO: make FrameAnimator2 that does not extend EventSender
 * TODO: LoopAnimator2
 * TODO: if you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 * TODO: Later you can maybe create a class that is called AnimSeq, which can sequence anim from a json file, akin to your legacy project
 * TODO: API like: spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {}
 * TODO: API like: animate(view, duration: 1, curve: .bezier(1, 0.4, 1, 0.5)) {$0.x = finalValue}
 */
class Animator2:FrameAnimator2 {
    var frameTick:FrameTick
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is needed in order to know when the animation is complete*/
    var initValues:InitValues
    var easing:EasingEquation/*Variable for holding the easing method*/
    typealias Completed = () -> Void
    //
    var completed:Completed = {}
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    init(initValues:Animator.InitValues, easing:@escaping EasingEquation = Easing.linear.ease, closure: @escaping FrameTick = {_ in}) {
        self.initValues = initValues
        self.frameTick = closure
        self.easing = easing
        //return TestingClass()
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
            //_ = completed(Animator.initValues, {_ in})//the animation completed, call the completed closure
            completed()
        }
        self.currentFrameCount += 1
    }
    /**
     * TODO: ⚠️️ Consider adding support for pauseing at a time in the anim?
     */
    func wait(duration:CGFloat, closure: () -> Void) -> Self {
        sleep(duration.int.uint32)//pause
        closure()/*Call the method*/
        return self
     }
    /**
     *
     */
    func onComplete(closure: @escaping Completed) -> Self{
        completed = closure//assign the closure
        return self
    }
    /**
     *
     */
    func pause(closure: (_ animRef:Animator2) -> Void) -> Self{
        stop()
        //closure()//execute the closure
        return self
    }
    /**
     *
     */
    func resume() {
        start()
    }
}

extension Animator2 {
    typealias InitValues = (duration:CGFloat,from:CGFloat,to:CGFloat)/*Signature for initValues*/
    static var initValues:InitValues = (duration:0.5,from:0,to:1)/*Default init values*/
    static var fps:CGFloat = 60//<--TODO: ⚠️️ this should be derived from a device variable
    var duration:CGFloat {get{return initValues.duration}set{initValues.duration = newValue}}/*In seconds*/
    var from:CGFloat {get{return initValues.from}set{initValues.from = newValue}}/*From this value*/
    var to:CGFloat {get{return initValues.to}set{initValues.to = newValue}}/*To this value*/
    var framesToEnd:CGFloat {return Animator.fps * duration}/*totFrameCount*/
}
/*
 
 let anim1 = Anim(dur:2.75,from:0,to:1) {
 //onFrame anim here, move X forward
 }.pause(at:1.25,for:2){//pauses the anim for a little bit
 //do some things, fetch data etc
 }.completed = LoopAnim(dur:2.75,from:0,to:1,repeat:3){//adds a new anim block to the completed callBack
 //onFrame anim here, rotate 360deg , this animation is repeated 3 times
 }.completed = {
 //this is the final complete call in the chain
 }
 anim1.start()//initiates the animation chain
 */
