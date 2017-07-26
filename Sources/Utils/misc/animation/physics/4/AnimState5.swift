import Foundation

struct AnimationState5<T> {
    let value: T
    let targetValue: T
    let velocity: T
    let stopVelocity: T
}

extension AnimationState5 {
    static func initPointValues() ->  AnimationState5<CGPoint>  {
        return .init(value: CGPoint(0,0), targetValue: CGPoint(0,0), velocity: CGPoint(0,0), stopVelocity: CGPoint(0,0))
    }
    static func initValues() ->  AnimationState5<CGFloat>  {
        return .init(value: 0.0, targetValue: 0.0, velocity: 0.0, stopVelocity: 0.0)
    }
}
