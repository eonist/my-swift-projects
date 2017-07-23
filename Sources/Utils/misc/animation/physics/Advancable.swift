import Foundation

protocol Advancable{
    associatedtype argType
    func add(_ value: argType) -> argType
    func substract(_ value: argType) -> argType
    func multiply(_ value: argType) -> argType
    func isNear(_ value:argType,_ epsilon:argType) -> Bool
    static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType)
    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool
}
extension CGFloat:Advancable{
    typealias argType = CGFloat
    func isNear(_ value: argType, _ epsilon: argType) -> Bool {
        return self.isNear(value, epsilon)
    }
    func multiply(_ value: argType) -> argType {
        return self * value
    }
    func substract(_ value: argType) -> argType {
        return self - value
    }
    func add(_ value: argType) -> argType {
        return self + value
    }
    static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType){
        let velocity:argType = targetValue.substract(value).multiply(easing)
        let value:argType = value.add(velocity)
        return (value,velocity)
    }
    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
