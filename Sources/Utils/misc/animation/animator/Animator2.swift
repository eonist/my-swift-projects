import Foundation
/**
 * .onComplete .onFrame .onStop .onStart
 */
class Animator2 {
    init(){
        
    }
    /**
     *
     */
    func onComplete() -> Self{
        return self
    }
    //var onFrameTick:()->Void = {return onFrame}
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
