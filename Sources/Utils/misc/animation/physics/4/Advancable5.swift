import Foundation

protocol Advancable5 {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static var defaults:AnimState5<Self> {get}
//    static var defaultEpsilon: Self { get }
//    static var defaultStopVelocity: Self { get }
//    static var defaultValue: Self {get}
//    static var defaultVelocity: Self {get}
//    static var defaultTargetValue: Self {get}
    func isNear( value: Self, epsilon: Self) -> Bool
}

extension CGFloat: Advancable5 {
    static var defaults: AnimState5<CGFloat>  = AnimState5<CGFloat>(0,0,0,0,0)
//    static let defaultEpsilon: CGFloat = 10e-5
//    static let defaultStopVelocity: CGFloat = 0
//    static let defaultValue: CGFloat = 0
//    static let defaultVelocity: CGFloat = 0
//    static let defaultTargetValue: CGFloat = 0
    func isNear( value:  CGFloat,  epsilon: CGFloat) -> Bool {
        return self.isNear(value,epsilon)
    }
}
extension CGPoint: Advancable5 {
    static var defaults: AnimState5<CGPoint>  = AnimState5<CGPoint>(CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
//    static var defaultEpsilon: CGPoint = CGPoint(CGFloat.defaultEpsilon,CGFloat.defaultEpsilon)
//    static let defaultStopVelocity: CGPoint = CGPoint(0,0)
//    static let defaultValue: CGPoint = CGPoint(0,0)
//    static let defaultVelocity: CGPoint = CGPoint(0,0)
//    static let defaultTargetValue: CGPoint = CGPoint(0,0)
    func isNear( value:  CGPoint,  epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
extension CGSize: Advancable5 {
    static var defaults: AnimState5<CGSize>  = AnimState5<CGSize>(CGSize(0,0),CGSize(0,0),CGSize(0,0),CGSize(0,0),CGSize(0,0))
    
//    static var defaultEpsilon: CGSize = CGSize(CGFloat.defaultEpsilon,CGFloat.defaultEpsilon)
//    static let defaultStopVelocity: CGSize = CGSize(0,0)
//    static let defaultValue: CGSize = CGSize(0,0)
//    static let defaultVelocity: CGSize = CGSize(0,0)
//    static let defaultTargetValue: CGSize = CGSize(0,0)
    func isNear( value:  CGSize,  epsilon: CGSize) -> Bool {
        return self.isNear(value,epsilon.w)
    }
}
extension CGRect: Advancable5 {
    static var defaults:AnimState5<CGRect>  =  AnimState5<CGRect>(CGRect(), CGRect(), CGRect(), CGRect(), CGRect(10e-5,10e-5,10e-5,10e-5))
//    
//    
//    static let defaultStopVelocity: CGRect = CGRect(0,0,0,0)
//    static var defaultEpsilon: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
//    static let defaultValue: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
//    static let defaultVelocity: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
//    static let defaultTargetValue: CGRect = CGRect(CGPoint.defaultEpsilon,CGSize.defaultEpsilon)
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.size.isNear(value.size,epsilon.size.w) && self.origin.isNear(value.origin,epsilon.origin.x)
    }
}
