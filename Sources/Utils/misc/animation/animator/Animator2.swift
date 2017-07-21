import Foundation
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2 {
    typealias FrameTick = () -> (CGFloat) -> Animator2 /*Makes the return type less verbose*/
    var onFrameTick:FrameTick
    init(){
        onFrameTick = self.onFrame
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
    func onFrame(_ value:CGFloat) -> Self{
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
