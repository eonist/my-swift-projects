import Foundation
@testable import Utils
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2:FrameAnimator {
    var frameTick:FrameTick
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is need in order to know when the animation is complete*/
    var initValues:InitValues
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    init(initValues:Animator.InitValues, closure: @escaping FrameTick) {
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
            completed()//the animation completed, call the completed closure
        }
        self.currentFrameCount += 1
    }
    /*func pause(durInSec:CGFloat, closure: (Int) -> Void) -> Self {
     closure(value)/*Call the method*/
     return self
     }*/
    /**
     *
     */
    func start(initValues:Animator.InitValues, closure: @escaping FrameTick){
        self.frameTick = closure
    }
    typealias Completed = () -> Void
    lazy var completed:Completed = {_ in }
    
    func onComplete(closure: @escaping Completed) -> Self{
        completed = closure/*assign the closure*/
        return self/*Always return self so we can chain*/
    }
    /**
     *
     */
//    func onFrame(closure: () -> Void) -> Self{
//        closure()/*execute the closure*/
//        return self/*Always return self so we can chain*/
//    }
    
    /**
     *
     */
//    func onFrame(_ value:CGFloat) -> Animator2{
//        return self
//    }
    /**
     *
     */
    func onStop()-> Self{
        return self
    }
    /**
     *
     */
    func onStart()-> Self{
        return self
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
