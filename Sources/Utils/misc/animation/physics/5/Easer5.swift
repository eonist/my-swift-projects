import Foundation
/**
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * NOTE: This is the Base class
 * TODO: ⚠️️ Maybe make a base class for Easer and Springer that they both can extend? that way you could change between them on a whim
 */
class Easer5<T:Advancable5>:FrameAnimator2, PhysicsAnimKind5{
    typealias FrameTickSignature = (T)->Void
    typealias OnComplete = () -> Void
    var easing:T/*This can be customized by setting the value but not via init*/
    var state:AnimState5<T>
    var onFrame:FrameTickSignature//TODO: ⚠️️ rename to onFrameTick,onFrameCallback?
    var onComplete:OnComplete = {}//add external onComplete closures when needed
//    var updatePos:(()->Void) = {_ in}//might have to make this lazy
    
    init(_ state:AnimState5<T>, _ easing:T, _ onFrame:@escaping FrameTickSignature) {
        self.state = state
        self.easing = easing
        self.onFrame = onFrame
        super.init()
//        self.updatePos = updatePosition
    }
    override func onFrameTick() {
        self.updatePosition()
//        self.updatePos()
        self.onFrame(value)
    }
    func updatePosition() {
        velocity = (targetValue - value) * easing
        value = value + velocity
        if assertStop {
            value = targetValue//set the final value
            stop()/*stop the animation*/
            onComplete()
            onComplete = {}/*resets onComplete closure, onComplete can only happen one time*/
        }
    }
    var assertStop:Bool {
        return state.velocity.isNear(value:stopVelocity, epsilon:epsilon)
    }
}
enum DefaultEasing{//find a better place for these
    static var value:CGFloat { return (0.2) }
    static var point:CGPoint { return CGPoint(0.2,0.2) }
    static var rect:CGRect { return CGRect(0.2,0.2,0.2,0.2) }
}
