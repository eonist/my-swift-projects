import Foundation
/**
 * TODO: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples
 * TODO: Rename initValues to config, as initvalues could indicate the start values, which it is not
 * TODO: Consider using other names from regex proposal
 */
/*
protocol PhysicsAnimKind4:class {
    associatedtype T: Advancable4
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    var initValues:InitValues {get set}
    /**/
    var targetValue:T {get set} /*Where value should go to*/
    var velocity:T {get set}/*Velocity*/
    var value:T {get set}/*The value that should be applied to the target*/
    var stopVelocity:T {get set}
    /*Event related*/
    var callBack:(T)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
}
*/
/**
 * Getters and setters for the value tuples
 */
/*
extension PhysicsAnimKind4{
    var targetValue:T {get{return initValues.targetValue}set{initValues.targetValue = newValue}}
    var velocity:T {get{return initValues.velocity}set{initValues.velocity = newValue}}
    var value:T {get{return initValues.value}set{initValues.value = newValue}}
    var stopVelocity:T {get{return initValues.stopVelocity}set{initValues.stopVelocity = newValue}}
}
*/
