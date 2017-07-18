import Foundation

class Easer2:BaseAnimation {
    /*Config values*/
    var easing:CGFloat
    /*Interim values*/
    var targetValue:CGFloat /*Where value should go to*/
    var velocity:CGFloat/*Velocity*/
    var value:CGFloat/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:CGFloat
    
    init(_ callBack:@escaping FrameTick,  _ easing:CGFloat , _ initVals:(value:CGFloat,targetValue:CGFloat,velocity:CGFloat,stopVelocity:CGFloat)) {
        self.value = initVals.value/*Set the init value*/
        self.targetValue = initVals.targetValue
        self.velocity = initVals.velocity
        self.callBack = callBack
        self.easing = easing
        self.stopVelocity = initVals.stopVelocity
        super.init()
    }
    func updatePosition() {
        velocity = (targetValue - value) * easing
        value = value + velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
