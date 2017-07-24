import Foundation

class Easer3<T: Advancable3>: FrameAnimator, PhysicsAnimKind3 {
    let initial: AnimationState<T>
    let target: AnimationState<T>
    var current: AnimationState<T>

    var damping: T
    var epsilon: T = T.defaultEpsilon
    
    var callback: (T) -> ()
    
    init(from initial: AnimationState<T>, to target: AnimationState<T>, damping: T, _ callback: @escaping (T) -> ()) {
        self.initial = initial
        self.current = initial
        self.target = target
        self.damping = damping
        self.callback = callback
    }
}
