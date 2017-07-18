import Foundation

class BaseAnimator:BaseAnimation {
    init() {
        super.init()
    }
    /**
     * SubClass this method and then call super.updatePosition()
     */
    func updatePosition() {
        if assertStop {stop()}
    }
    /**
     * SubClass this method and implement the standStill assert
     */
    var assertStop:Bool {
        fatalError("must be subClassed")
    }
    /**
     * SubClass this method and call super.onFrame() and then call callBack method speccific to your class
     */
    override func onFrame(){
        updatePosition()
    }
}
