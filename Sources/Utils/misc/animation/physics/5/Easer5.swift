import Foundation
/**
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * NOTE: This is the Base class
 * TODO: ⚠️️ Maybe make a base class for Easer and Springer that they both can extend? that way you could change between them on a whim
 */
class Easer5<T: Advancable5>:FrameAnimator2, PhysicsAnimKind5{
    typealias FrameTickSignature = (T)->Void
    var easing:T/*This can be customized by setting the value but not via init*/
    var state:AnimState5<T>
    var onFrame:FrameTickSignature//TODO: ⚠️️ rename to onFrameTick,onFrameCallback?
    var onComplete:()->Void = {}//add external onComplete closures when needed
    
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
        if assertStop {
            state.value = state.targetValue//set the final value
            stop()//stop the animation
            onComplete()
        }
    }
    var assertStop:Bool {
        return state.velocity.isNear(value:state.stopVelocity, epsilon:state.epsilon)
    }
}
struct DefaultEasing{
    static var value:CGFloat { return (0.2) }
    static var point:CGPoint { return CGPoint(0.2,0.2) }
    static var rect:CGRect { return CGRect(0.2,0.2,0.2,0.2) }
}
