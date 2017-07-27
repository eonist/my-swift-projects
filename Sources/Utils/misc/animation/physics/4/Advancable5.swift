import Foundation

protocol Advancable5/*:Comparable*/ {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    
    static var defaults:AnimState5<Self> {get}
    func isNear( value: Self, epsilon: Self) -> Bool
}

extension CGFloat: Advancable5 {
    static var defaults: AnimState5<CGFloat>  = AnimState5<CGFloat>(0,0,0,0,0)
    func isNear( value:  CGFloat,  epsilon: CGFloat) -> Bool {
        return self.isNear(value,epsilon)
    }
}
extension CGPoint: Advancable5 {
    static var defaults: AnimState5<CGPoint>  = AnimState5<CGPoint>(CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    func isNear( value:  CGPoint,  epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
extension CGSize: Advancable5 {
    static var defaults: AnimState5<CGSize>  = AnimState5<CGSize>(CGSize(0,0),CGSize(0,0),CGSize(0,0),CGSize(0,0),CGSize(0,0))
    func isNear( value:  CGSize,  epsilon: CGSize) -> Bool {
        return self.isNear(value,epsilon.w)
    }
}
extension CGRect: Advancable5 {
    static var defaults:AnimState5<CGRect>  =  AnimState5<CGRect>(CGRect(), CGRect(), CGRect(), CGRect(), CGRect(10e-5,10e-5,10e-5,10e-5))
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.size.isNear(value.size,epsilon.size.w) && self.origin.isNear(value.origin,epsilon.origin.x)
    }
}
