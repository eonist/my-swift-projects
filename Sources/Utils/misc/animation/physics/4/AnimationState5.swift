import Foundation

struct AnimationState4<T> {
    let value: T
    let targetValue: T
    let velocity: T
    let stopVelocity: T
}

extension AnimationState4 {
    static func initPointValues() ->  AnimationState4<CGPoint>  {
        return AnimationState4<CGPoint>.init(value: CGPoint(0,0), targetValue: CGPoint(0,0), velocity: CGPoint(0,0), stopVelocity: CGPoint(0,0))
    }
    static func initValues() ->  AnimationState4<CGFloat>  {
        return AnimationState4<CGFloat>.init(value: 0.0, targetValue: 0.0, velocity: 0.0, stopVelocity: 0.0)
    }
}
