import Foundation

class Spring:BaseAnimation {
    /*Config values*/
    var config:(spring:CGFloat,friction:CGFloat)
    /*Interim values*/
    var targetValue:CGFloat = 0/*Where it should go*/
    var velocity:CGFloat = 0/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick,_ value:CGFloat = 0, config:(spring:CGFloat, friction:CGFloat) = (spring:0.02,friction:0.90)) {
        self.value = value/*Set the init value*/
        self.callBack = callBack
        self.config = config
        super.init(animatable)
    }
    func updatePosition() {
        let dx = targetValue - value
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
