import Foundation
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2 {
    typealias FrameTick = ((CGFloat) -> Animator2)?/*Makes the return type less verbose*/
    var onFrameTick:FrameTick = {return {(value:CGFloat) -> Animator2 in}}()
    init(){
        
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
