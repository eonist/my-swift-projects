import Foundation
/**
 * TODO: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples 
 */
protocol PhysicsAnimationKind:class{//TODO: ⚠️️ Rename to PhysicsAnimKind
    associatedtype argType
    /*Signatures*/
    typealias FrameTickSignature = (argType)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:argType,targetValue:argType,velocity:argType,stopVelocity:argType)
    /**/
    var initValues:InitValues {get set}
    /**/
    var targetValue:argType {get set} /*Where value should go to*/
    var velocity:argType {get set}/*Velocity*/
    var value:argType {get set}/*The value that should be applied to the target*/
    var stopVelocity:argType {get set}
    /*Event related*/
    var callBack:(argType)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
}
/**
 * Getters and setters for the value tuples
 */
extension PhysicsAnimationKind{
    var targetValue:argType {get{return initValues.targetValue}set{initValues.targetValue = newValue}}
    var velocity:argType {get{return initValues.velocity}set{initValues.velocity = newValue}}
    var value:argType {get{return initValues.value}set{initValues.value = newValue}}
    var stopVelocity:argType {get{return initValues.stopVelocity}set{initValues.stopVelocity = newValue}}
}
