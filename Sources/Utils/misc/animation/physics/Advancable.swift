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
    func isNear(_ value: CGFloat, _ epsilon: CGFloat) -> Bool {
        return self.isNear(value, epsilon)
    }
    func multiply(_ value: CGFloat) -> CGFloat {
        return self * value
    }
    func substract(_ value: CGFloat) -> CGFloat {
        return self - value
    }
    func add(_ value: CGFloat) -> CGFloat {
        return self + value
    }
}
