import Foundation

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Int: Summable {}
extension CGFloat: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
    return x + y
}
