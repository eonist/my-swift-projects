import Foundation

class Easer3<T: Advancable3>: FrameAnimator, PhysicsAnimKind3 {
    let initial: AnimationState<T>
    let target: AnimationState<T>
    var current: AnimationState<T>

    var damping: T
    var epsilon: T = T.defaultEpsilon
}
