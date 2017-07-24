import Foundation

class Easer4<T: Advancable4>:FrameAnimator, PhysicsAnimKind4{
    var easing:T
    var initValues:PhysicsAnimKind4.InitValues
    var callBack:FrameTickSignature
    
    init(_ initValues:PhysicsAnimKind4.InitValues, _ easing:T, _ callBack:@escaping FrameTickSignature) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func onFrame(){
        self.updatePosition(value)
        self.callBack(value)
    }
    func updatePosition() {
        velocity = (targetValue - value) * easing
        value += velocity
        if assertStop {stop()}

    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    override func updatePosition() {
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
