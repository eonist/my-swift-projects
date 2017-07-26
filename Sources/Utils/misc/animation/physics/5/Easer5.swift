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
    var onFrame:FrameTickSignature//TODO: ⚠️️ rename to onFrameTick,onFrameCallback?
    
    init(_ state:AnimState5<T>, _ easing:T, _ onFrame:@escaping FrameTickSignature) {
        self.state = state
        self.onFrame = onFrame
        self.easing = easing
        super.init()
    }
    override func onFrameTick() {
        self.updatePosition()
        self.onFrame(state.value)
    }
    func updatePosition() {
        state.velocity = (state.targetValue - state.value) * easing
        state.value = state.value + state.velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return state.velocity.isNear(value:state.stopVelocity, epsilon:epsilon)
    }
}
