import Foundation
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2 {
    typealias FrameTick = ((CGFloat) -> Animator2)?
    //(CGFloat) -> Animator2 /*Makes the return type less verbose*/
    lazy var onFrameTick:FrameTick = {
        return self.onFrame
    }()
    init(){
        self.onFrameTick = onFrame
    }
    /**
     *
     */
    func onComplete() -> Self{
        return self
    }
    
    /**
     *
     */
    func onFrame(_ value:CGFloat) -> Animator2{
        return self
    }
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
