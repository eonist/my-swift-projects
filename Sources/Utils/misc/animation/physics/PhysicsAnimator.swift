import Foundation

class PhysicsAnimator<T:Advancable>:FrameAnimator {
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    var easing:T
    var initValues:InitValues
    var callBack:FrameTickSignature
    
    var targetValue:T {get{return initValues.targetValue}set{initValues.targetValue = newValue}} /*Where value should go to*/
    var velocity:T {get{return initValues.velocity}set{initValues.velocity = newValue}}/*Velocity*/
    var value:T {get{return initValues.value}set{initValues.value = newValue}}/*The value that should be applied to the target*/
    var stopVelocity:T {get{return initValues.stopVelocity}set{initValues.stopVelocity = newValue}}
    
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ easing:T) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func onFrame(){
        self.updatePosition()
        self.callBack(value)
    }
    func updatePosition() {
        velocity = targetValue.substract(value).multiply(easing)
        value = value.add(velocity)
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
