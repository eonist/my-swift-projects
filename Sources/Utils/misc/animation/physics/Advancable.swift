import Foundation

protocol Advancable{
    associatedtype argType
    func add(_ value: argType) -> argType
    func substract(_ value: argType) -> argType
    func multiply(_ value: argType) -> argType
    func isNear(_ value:argType,_ epsilon:argType) -> Bool
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
}
