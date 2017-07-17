import Foundation

class Spring<T:NumberKind>:BaseAnimation {
    /*Config values*/
    var config:(spring:T,friction:T)
    /*Interim values*/
    var targetValue:T /*Where it should go*/
    var velocity:T/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick, config:(spring:T, friction:T)/* = (spring:0.02,friction:0.90)*/, _ value:T) {
        self.value = value/*Set the init value*/
        self.callBack = callBack
        self.config = config
        super.init(animatable)
    }
    func updatePosition() {
        let dx = (targetValue - value)
        let ax = dx * config.spring
        velocity = velocity + ax
        velocity = velocity * config.friction
        value = value + velocity
        checkForStop()
    }
    func checkForStop() {
        //Swift.print("velocity: " + "\(velocity)")
        if velocity.isNear(0, 10e-5) {
            //Swift.print("checkForStop.stop()")
            stop()
        }
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}

//Continue here:
    //Figure out FrameTick in gerics, and then try to subbClass this Spring class
