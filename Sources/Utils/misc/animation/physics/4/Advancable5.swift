import Foundation

protocol Advancable5 {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static var defaultEpsilon: Self { get }
    static var defaultStopVelocity: Self { get }
    static var defaultValue: Self {get}
    static var defaultVelocity: Self {get}
    static var defaultTargetValue: Self {get}
    func isNear( value: Self, epsilon: Self) -> Bool
}

extension CGFloat: Advancable5 {
    static let defaultEpsilon: CGFloat = 10e-5
    static let defaultStopVelocity: CGFloat = 0
    func isNear( value:  CGFloat,  epsilon: CGFloat) -> Bool {
        return self.isNear(value,epsilon)
    }
}
extension CGPoint: Advancable5 {
    static var defaultEpsilon: CGPoint = CGPoint(CGFloat.defaultEpsilon,CGFloat.defaultEpsilon)
    static let defaultStopVelocity: CGPoint = CGPoint(0,0)
    func isNear( value:  CGPoint,  epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
extension CGSize: Advancable5 {
    static var defaultEpsilon: CGSize = CGSize(CGFloat.defaultEpsilon,CGFloat.defaultEpsilon)
    static let defaultStopVelocity: CGSize = CGSize(0,0)
    func isNear( value:  CGSize,  epsilon: CGSize) -> Bool {
        return self.isNear(value,epsilon.w)
    }
}
extension CGRect: Advancable5 {
    static var defaultEasing:CGRect = CGRect(0.2,0.2,0.2,0.2)
    static let defaultStopVelocity: CGRect = CGRect(0,0,0,0)
    static var defaultState:AnimState5<CGRect>  =  AnimState5<CGRect>(CGRect(), CGRect(), CGRect(), CGRect())
    static var defaultEpsilon: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.size.isNear(value.size,epsilon.size.w) && self.origin.isNear(value.origin,epsilon.origin.x)
    }
}
