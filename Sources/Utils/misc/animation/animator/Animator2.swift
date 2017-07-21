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
    /**
     *
     */
    var onFrame:(_ value:CGFloat) -> Animator2{
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
