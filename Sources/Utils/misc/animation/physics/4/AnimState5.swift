import Foundation

struct AnimState5<T> {
    var value: T
    var targetValue: T
    var velocity: T
    var stopVelocity: T
    init(_ value: T,_ targetValue: T,_ velocity: T,_ stopVelocity:T){
        self.value = value
        self.targetValue = targetValue
        self.velocity = velocity
        self.stopVelocity = stopVelocity
    }
}

extension AnimState5 {
    static func initValues() ->  AnimState5<CGFloat>  {
        return AnimState5<CGFloat>.init(0, 0, 0, 0)
    }
    static func initPointValues() ->  AnimState5<CGPoint>  {
        return AnimState5<CGPoint>(CGPoint(0,0), CGPoint(0,0), CGPoint(0,0), CGPoint(0,0))
    }
    static func initRectValues() ->  AnimState5<CGRect>  {
        return AnimState5<CGRect>(CGRect(), CGRect(), CGRect(), CGRect())
    }
    
    static var initConfig:CGFloat { return (0.2) }
    static var initPointConfig:CGPoint { return CGPoint(0.2,0.2) }
    static var initRectConfig:CGRect { return CGRect(0.2,0.2,0.2,0.2) }
}
