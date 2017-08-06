/*import Foundation

protocol Advancable3{
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    
    static var defaultEpsilon: Self { get }
    
    func isNear(_ value: Self, within epsilon: Self) -> Bool
//    
//    static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType)
//    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool
}

extension CGFloat: Advancable3 {
    static let defaultEpsilon: CGFloat = 10e-5
    
    func isNear(_ value:  CGFloat, within epsilon: CGFloat) -> Bool {
        return abs(self - value) < epsilon//TODO: 
    }
}
extension CGPoint: Advancable3 {
    static let defaultEpsilon: CGPoint = CGPoint(10e-5,10e-5)
    
    func isNear(_ value:  CGPoint, within epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
*/
//extension CGFloat:Advancable3{
//    typealias argType = CGFloat
//    func isNear(_ value: argType, _ epsilon: argType) -> Bool {
//        return self.isNear(value, epsilon)
//    }
//    func multiply(_ value: argType) -> argType {
//        return self * value
//    }
//    func substract(_ value: argType) -> argType {
//        return self - value
//    }
//    func add(_ value: argType) -> argType {
//        return self + value
//    }
//    static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType){
//        let velocity:argType = targetValue.substract(value).multiply(easing)
//        let value:argType = value.add(velocity)
//        return (value,velocity)
//    }
//    static func assertStop(velocity:argType,stopVelocity:argType) -> Bool {
//        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
//    }
//}

