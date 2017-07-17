import Foundation
/**
 * Experimental
 * TODO: ⚠️️ Add more operators etc
 * NOTE: These methods only seem to work when a method with generic properties is involved
 */
protocol NumberKind {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
}
extension Int:NumberKind {}
extension CGFloat:NumberKind {}
//extension Float: NumberKind {}
//extension Double: NumberKind {}
//extension UInt: NumberKind {}


func add<T:NumberKind>(x: T, y: T) -> T {
    return x + y
}
func substract<T: NumberKind>(x: T, y: T) -> T {
    return x - y
}
func divide<T:NumberKind>(x: T, y: T) -> T {
    return x / y
}
func multiply<T:NumberKind>(x: T, y: T) -> T {
    return x * y
}
