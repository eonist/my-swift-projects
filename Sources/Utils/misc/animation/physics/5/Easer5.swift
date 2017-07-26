import Foundation

import Foundation
/**
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * NOTE: This is the Base class
 * TODO: Maybe make a base class for Easer and Springer that they both can extend? that way you could change between them on a whim
 */
class Easer5<T: Advancable5>:FrameAnimator2, PhysicsAnimKind5{
    
    typealias FrameTickSignature = (T)->Void
    var epsilon: T = T.defaultEpsilon
    var easing:T = T.defaultEpsilon/*This can be customized by setting the value but not via init*/
    var state:AnimState5<T>
    var callBack:FrameTickSignature//TODO: ⚠️️ rename to onFrameTick,onFrameCallback?
    
    init(_ initValues:AnimState5, _ easing:T, _ onFrame:@escaping FrameTickSignature) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func onFrameTick() {
        self.updatePosition()
        self.callBack(state.value)
    }
    func updatePosition() {
        state.velocity = (state.targetValue - state.value) * easing
        state.value = state.value + state.velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(value:state.stopVelocity, epsilon:epsilon)
    }
}
/*Convenient default init values*/
var initConfig:CGFloat { return (0.2) }
var initPointConfig:CGPoint { return CGPoint(0.2,0.2) }
/*CGPoint*/
var initPointValues: Easer4<CGPoint>.InitValues = (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
var initValues: Easer4<CGFloat>.InitValues = (0,0,0,0)
