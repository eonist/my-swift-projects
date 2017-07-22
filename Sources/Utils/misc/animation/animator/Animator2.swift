import Foundation
@testable import Utils
/*
 
 let anim1 = Anim(dur:2.75,from:0,to:1) {
    //onFrame anim here, move X forward
 }.pause(at:1.25,for:2){//pauses the anim for a little bit
    //do some things, fetch data etc
 }.completed = LoopAnim(dur:2.75,from:0,to:1,repeat:3){//adds a new anim block to the completed callBack
    //onFrame anim here, rotate 360deg , this animation is repeated 3 times
 }.complete = {
    //this is the final complete call in the chain
 }
 anim1.start()//initiates the animation chain
 
 
 */

/**
 * .onComplete .onFrame .onStop .onStart
 add spring and ease as well
 animate(view, duration: 1, curve: .bezier(1, 0.4, 1, 0.5)) {
 $0.x = finalValue
 }
 case 4:
 spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {
 
 also loop?
 
 where do you start? at the end!
 
 //it would be cool to have background thread support
 //if you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 //Later you can maybe create a class that is called AnimSeq, which can sequence anim from a json file, akin to your legacy project
 
 
 
 //continue here: 🏀
    //make FrameAnimator2 that does not extend EventSender
    //make LoopAnimator2
    //Animate a ball 👈
    //look at other Libs and Future promis hydra etc
 
 
 
 */
class Animator2:FrameAnimator {
    var frameTick:FrameTick
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is needed in order to know when the animation is complete*/
    var initValues:InitValues

    typealias Completed = () -> Void
    //
    var completed:Completed = {}
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    init(initValues:Animator.InitValues, closure: @escaping FrameTick = {_ in}) {
        self.initValues = initValues
        self.frameTick = closure
        //return TestingClass()
        super.init(AnimProxy.shared)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        //let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        frameTick(0)/*Call the callBack onFrame method*/
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
    func pause(closure: (_ animRef:Animator) -> Void) -> Self{
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
