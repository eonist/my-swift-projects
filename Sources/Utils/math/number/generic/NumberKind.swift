import Foundation
/**
 * Experimental
 * TODO: ⚠️️ Add more operators *= -= += /= etc
 * NOTE: These methods only seem to work when a method with generic properties is involved
 */
protocol ArithmeticKind {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    func isNear(_ value:Self, _ epsilon:CGFloat)->Bool
}

extension CGFloat:ArithmeticKind {}
extension CGPoint:ArithmeticKind {}
//extension Int:NumberKind {}
//extension Float: NumberKind {}
//extension Double: NumberKind {}
//extension UInt: NumberKind {}


func add<T:ArithmeticKind>(x: T, y: T) -> T {
    return x + y
}
func substract<T: ArithmeticKind>(x: T, y: T) -> T {
    return x - y
}
func divide<T:ArithmeticKind>(x: T, y: T) -> T {
    return x / y
}
func multiply<T:ArithmeticKind>(x: T, y: T) -> T {
    return x * y
}
