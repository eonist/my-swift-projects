import Foundation

protocol Advancable5 {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static var defaultEpsilon: Self { get }
    func isNear( value: Self, epsilon: Self) -> Bool
    
}

extension CGFloat: Advancable5 {
    static let defaultEpsilon: CGFloat = 10e-5
    func isNear( value:  CGFloat,  epsilon: CGFloat) -> Bool {
        return self.isNear(value,epsilon)
    }
}
extension CGPoint: Advancable5 {
    static var defaultEpsilon: CGPoint = CGPoint(10e-5,10e-5)
    func isNear( value:  CGPoint,  epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
extension CGSize: Advancable5 {
    static var defaultEpsilon: CGSize = CGSize(10e-5,10e-5)
    func isNear( value:  CGSize,  epsilon: CGSize) -> Bool {
        return self.w.isNear(value.w,epsilon.w) && self.h.isNear(value.h,epsilon.h)
    }
}
extension CGRect: Advancable5 {
    static func +(lhs: CGRect, rhs: CGRect) -> CGRect {
        <#code#>
    }

    static var defaultEpsilon: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.w.isNear(value.w,epsilon.w) && self.h.isNear(value.h,epsilon.h)
    }
}
