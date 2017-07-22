import Foundation
@testable import Utils
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2:FrameAnimator {
    var frameTick:FrameTick
    var currentFrameCount:CGFloat = 0/*curFrameCount, this is need in order to know when the animation is complete*/
    private var framesToEnd:CGFloat {return Animator.fps * duration}/*totFrameCount*/
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    init(initValues:Animator.InitValues, closure: @escaping FrameTick) {
        self.frameTick = closure
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
            super.onEvent(AnimEvent(AnimEvent.completed,self))/*Notify listeners that the animation completed*/
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
//    typealias Completed = () -> Animator2
//    lazy var completed:Completed = {
//        Swift.print("completed")
//    }
    func onComplete(closure: () -> Void) -> Self{
        closure()/*execute the closure*/
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

