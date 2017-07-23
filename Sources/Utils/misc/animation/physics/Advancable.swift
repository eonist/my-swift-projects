import Foundation

protocol Advancable{
    associatedtype argType
    func add(_ value: argType) -> argType
    func substract(_ value: argType) -> argType
    func multiply(_ value: argType) -> argType
    func isNear(_ value:argType,_ epsilon:argType) -> Bool
    func updatePosition()
    var assertStop:Bool {get}
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
    func updatePosition(velocity:argType,value:argType,easing:argType) {
        velocity = targetValue.substract(value).multiply(easing)
        value = value.add(velocity)
        
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}
