import Foundation

protocol Advancable4 {
    static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType)
    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool
}
extension Advancable4{
    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
