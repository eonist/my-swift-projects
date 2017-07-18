import Foundation

protocol PhysicsAnimationKind {
    associatedtype argType
    /**/
    var config:(spring:argType,friction:argType) {get set}
    /**/
    var targetValue:argType {get set} /*Where value should go to*/
    var velocity:argType {get set}/*Velocity*/
    var value:argType {get set}/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:(argType)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:argType {get set}
}
extension PhysicsAnimationKind{
    
}
