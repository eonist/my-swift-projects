import Foundation

protocol PhysicsAnimationKind {
    var config:(spring:T,friction:T) {get set}
    
    var targetValue:T {get set} /*Where value should go to*/
    var velocity:T {get set}/*Velocity*/
    var value:T {get set}/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:Springer<T>.FrameTick {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:T {get set}
}
