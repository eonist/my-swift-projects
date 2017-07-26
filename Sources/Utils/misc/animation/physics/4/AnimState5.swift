import Foundation

struct AnimState5<T> {
    var value: T
    var targetValue: T
    var velocity: T
    var stopVelocity: T
    init(value: T,targetValue: T,velocity: T,stopVelocity:T){
        self.value = value
        self.targetValue = targetValue
        self.velocity = velocity
        self.stopVelocity = stopVelocity
    }
}

extension AnimState5 {
    static func initPointValues() ->  AnimState5<CGPoint>  {
        return AnimState5<CGPoint>.init(value: CGPoint(0,0), targetValue: CGPoint(0,0), velocity: CGPoint(0,0), stopVelocity: CGPoint(0,0))
    }
    static func initValues() ->  AnimState5<CGFloat>  {
        return AnimState5<CGPoint>.init(value: 0.0, targetValue: 0.0, velocity: 0.0, stopVelocity: 0.0)
    }
    static var initConfig:CGFloat { return (0.2) }
    static var initPointConfig:CGPoint { return CGPoint(0.2,0.2) }
}
