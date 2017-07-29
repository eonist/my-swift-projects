import Foundation

/**
 * TODO: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples
 * TODO: ⚠️️ Rename initValues to config, as initvalues could indicate the start values, which it is not
 * TODO: ⚠️️ Consider using other names from regex proposal
 */
protocol PhysicsAnimKind5:class,FrameAnimatable2 {
    associatedtype T: Advancable5
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    var state:AnimState5<T> {get set}
    var onFrame:(T)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
}
/**
 * Getters and setters for easier access to state
 */
extension PhysicsAnimKind5{
    /**
     * New,convenient when chaining
     */
    func setTargetValue(_ targetValue:T) -> Self{//rename to setTarget
        self.targetValue = targetValue
        return self/*Enables chaining*/
    }
    var targetValue:T {get{return state.targetValue}set{state.targetValue = newValue}}
    var velocity:T {get{return state.velocity}set{state.velocity = newValue}}
    var value:T {get{return state.value}set{state.value = newValue}}
    var epsilon:T {get{return state.epsilon}set{state.epsilon = newValue}}
    var stopVelocity:T {get{return state.stopVelocity}set{state.stopVelocity = newValue}}
}
