import Foundation



/**
 * TODO: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples
 */
/*
protocol PhysicsAnimKind3:class{//TODO: ⚠️️ Rename to PhysicsAnimKind
    associatedtype T: Advancable3
    
    var initial: AnimationState<T> { get }
    var current: AnimationState<T> { get set }
    var target: AnimationState<T> { get }
    
    func advance(_ initial:AnimationState<T>, current: AnimationState<T>, target: AnimationState<T>, damping: T) -> AnimationState<T>
    
    var callback: (T) -> () {get set}
}
 */
/**
 * Getters and setters for the value tuples
 */
/*
extension PhysicsAnimKind3{
    
    func advance(_ initial:AnimationState<T>,  current: AnimationState<T>, target: AnimationState<T>, damping: T) -> AnimationState<T> {
        let velocity = (target.value - current.value) * damping
        let value = target.value + current.velocity
        //(value: value, velocity: velocity, target: target, stopVelocity: initial.stopVelocity)
        return AnimationState(value: value, velocity: velocity, target: target.target, stopVelocity: initial.stopVelocity)
    }
    

//    var targetValue:argType {get{return initValues.targetValue}set{initValues.targetValue = newValue}}
//    var velocity:argType {get{return initValues.velocity}set{initValues.velocity = newValue}}
//    var value:argType {get{return initValues.value}set{initValues.value = newValue}}
//    var stopVelocity:argType {get{return initValues.stopVelocity}set{initValues.stopVelocity = newValue}}
}

*/
