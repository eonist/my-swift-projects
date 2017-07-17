import Foundation

class Easer<T:NumberKind>:BaseAnimation {
    typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    /*Config values*/
    var config:(easing:T,friction:T)
    /*Interim values*/
    var targetValue:T /*Where value should go to*/
    var velocity:T/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:T
    
    init(_ callBack:@escaping FrameTick,  _ config:(easing:T) , _ initVals:(value:T,targetValue:T,velocity:T,stopVelocity:T)) {
        self.value = initVals.value/*Set the init value*/
        self.targetValue = initVals.targetValue
        self.velocity = initVals.velocity
        self.callBack = callBack
        self.config = config
        self.stopVelocity = initVals.stopVelocity
        super.init()
    }
    func updatePosition() {
        velocity = (targetValue - value) * config.easing
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
