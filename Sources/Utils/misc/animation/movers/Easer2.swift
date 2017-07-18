import Foundation

class Easer2:BaseAnimator {
    typealias InitValues = (value:CGFloat,targetValue:CGFloat,velocity:CGFloat,stopVelocity:CGFloat)
    static var defaultInitValues:InitValues = (0,0,0,0)
    /*Config values*/
    var easing:CGFloat/*Amount of easing*/
    /*Interim values*/
    var targetValue:CGFloat /*Where value should go to*/
    var velocity:CGFloat/*Velocity*/
    var value:CGFloat/*The value that should be applied to the target*/
    var stopVelocity:CGFloat/*The velocity value that is considered standstill*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping FrameTick = {_ in},  _ easing:CGFloat = 0.2 , _ initVals:InitValues = Easer2.defaultInitValues) {
        self.value = initVals.value/*Set the init value*/
        self.targetValue = initVals.targetValue
        self.velocity = initVals.velocity
        self.stopVelocity = initVals.stopVelocity
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func updatePosition() {
        velocity = (targetValue - value) * easing
        value = value + velocity
        super.updatePosition()
    }
    override var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    override func onFrame(){
        super.onFrame()
        callBack(value)
    }
}
