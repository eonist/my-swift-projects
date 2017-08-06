/*
 import Foundation

class Easer3<T: Advancable3>: FrameAnimator, PhysicsAnimKind3 {
    let initial: AnimationState<T>
    let target: AnimationState<T>
    var current: AnimationState<T>

    var damping: T
    var epsilon: T = T.defaultEpsilon
    
    var callback: (T) -> ()
    
    init( initial: AnimationState<T>, target: AnimationState<T>, damping: T, _ callback: @escaping (T) -> ()) {
        self.initial = initial
        self.current = initial
        self.target = target
        self.damping = damping
        self.callback = callback
    }
    override func onFrame() {
        self.update()
        self.callback(self.current.value)
    }
    
    func update() {
        self.current = self.advance(initial, current: current, target: target, damping: damping)
        if self.hasReachedTargetVelocity() {
            self.stop()
        }
    }
    
    func hasReachedTargetVelocity() -> Bool {
        let current = self.current.velocity
        let target = self.target.velocity
        return current.isNear(target, within: self.epsilon)
    }
}
*/
