import Foundation

protocol PhysicsAnimKind4:class {
    associatedtype T: Advancable3
    typealias FrameTickSignature = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
}
