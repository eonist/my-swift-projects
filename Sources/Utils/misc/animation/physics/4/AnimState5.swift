import Foundation

struct AnimaState5<T> {
    let value: T
    let targetValue: T
    let velocity: T
    let stopVelocity: T
}

extension AnimaState5 {
    static func initPointValues() ->  Self<CGPoint>  {
        return .init(value: CGPoint(0,0), targetValue: CGPoint(0,0), velocity: CGPoint(0,0), stopVelocity: CGPoint(0,0))
    }
    static func initValues() ->  Self<CGFloat>  {
        return .init(value: 0.0, targetValue: 0.0, velocity: 0.0, stopVelocity: 0.0)
    }
}
