import Foundation

protocol Advancable{
    associatedtype argType
    func add(_ value: argType) -> argType
    func substract(_ value: argType) -> argType
    func multiply(_ value: argType) -> argType
    func isNear(_ value:argType,_ epsilon:argType) -> Bool
}
