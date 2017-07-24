import Foundation

protocol Advancable4 {
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    
    static var defaultEpsilon: Self { get }
    static var defaultConfig: Self { get }
    func isNear(_ value: Self, within epsilon: Self) -> Bool
    //static func updatePosition(velocity:argType,value:argType,targetValue:argType,easing:argType) -> (value:argType,velocity:argType)
    //static func assertStop(velocity:argType,stopVelocity:argType) -> Bool
}

extension CGFloat: Advancable4 {
    static let defaultEpsilon: CGFloat = 10e-5
    static let defaultConfig:CGFloat = (0.2)/*Convenient*/
    static let initValues:Advancable4.InitValues = (value:0,targetValue:0,velocity:0,stopVelocity:0)/*Convenient*/
    
    func isNear(_ value:  CGFloat, _ epsilon: CGFloat) -> Bool {
        return self.isNear(value,epsilon)
    }
}
extension CGPoint: Advancable4 {
    static var defaultConfig: CGPoint = CGPoint(0.2,0.2)
    static var defaultEpsilon: CGPoint = CGPoint(10e-5,10e-5)
    //static let defaultEpsilon: CGPoint = CGPoint(10e-5,10e-5)
    func isNear(_ value:  CGPoint, within epsilon: CGPoint) -> Bool {
        return self.isNear(value,epsilon.x)
    }
}
