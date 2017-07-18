import Foundation
/**
 * NOTE: This class was attempted with regular OOP but it was not scalable, every time you subclassed the BaseClass you would have setup all the var's again
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * TODO: ⚠️️ The math can be refactored if you add += *= to ArithmeticKind
 */
class Easer<T>:BaseAnimation,PhysicsAnimationKind {
    typealias argType = T
    var easing:T//CGPoint(0.2,0.2)
    var initValues:InitValues
    var config:Config/*Config values*/
    var callBack:FrameTickSignature
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ config:Config) {
        self.initValues = initValues
        self.callBack = callBack
        self.config = config
        super.init()
    }

    init(_ callBack:@escaping Springer.FrameTick,  _ easing:T , _ initVals:Springer.InitValues) {
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
/**/
