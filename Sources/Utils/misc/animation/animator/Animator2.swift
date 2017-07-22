import Foundation
@testable import Utils
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2 {
    var frameTick:FrameTick
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    init(initValues:Animator.InitValues, closure: @escaping FrameTick) {
        self.frameTick = closure
        //return TestingClass()
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
    typealias Completed = () -> Animator2
    lazy var completed:Completed = {
        Swift.print("completed")
    }
//    func onComplete(closure: () -> Void) -> Self{
//        closure()/*execute the closure*/
//        return self/*Always return self so we can chain*/
//    }
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

