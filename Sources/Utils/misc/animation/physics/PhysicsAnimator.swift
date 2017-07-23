import Foundation

class PhysicsAnimator<T:Advancable>:FrameAnimator {
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    var easing:T
    var initValues:InitValues
    var callBack:FrameTickSignature
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ easing:T) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func onFrame(){
        self.updatePosition(value)
        self.callBack(value)
    }
    func updatePosition<T:Advancable>(_ value:T) {
        let velocity = targetValue.substract(value).multiply(easing)
        value = value.add(velocity)
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
