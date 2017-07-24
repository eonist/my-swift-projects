import Foundation

struct AnimationState<T> {
    let value: T
    let velocity: T
    let target: T
    let stopVelocity: T
}

struct CompositeAnimationState<T,V:AnimationState<V>> {
    
}
