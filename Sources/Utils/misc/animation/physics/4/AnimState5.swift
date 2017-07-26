import Foundation
/**
 * TODO:  considerremoving stopVelocity or make it optional
 */
struct AnimState5<T:Advancable5> {
    var value: T/*the current value of the animation*/
    var targetValue: T/*Where the value want to go*/
    var velocity: T/*speed of the animation*/
    var stopVelocity: T/*usually when velocity reaches zero, but this can sometimes be other values*/
    var epsilon: T
    init(_ value: T,_ targetValue: T,_ velocity: T,_ stopVelocity:T = T.defaultStopVelocity, _ epsilon:T = T.defaultEpsilon){
        self.value = value
        self.targetValue = targetValue
        self.velocity = velocity
        self.stopVelocity = stopVelocity
        self.epsilon = epsilon
    }
}
extension AnimState5 {
    //default states
    static var initValues:AnimState5<CGFloat>  {
        return AnimState5<CGFloat>.init(0, 0, 0, 0)
    }
    static var initPointValues:AnimState5<CGPoint>  {
        return AnimState5<CGPoint>(CGPoint(0,0), CGPoint(0,0), CGPoint(0,0), CGPoint(0,0))
    }
    static var initRectValues:AnimState5<CGRect>  {
        return AnimState5<CGRect>(CGRect(), CGRect(), CGRect(), CGRect())
    }
    //default configs
    static var initConfig:CGFloat { return (0.2) }
    static var initPointConfig:CGPoint { return CGPoint(0.2,0.2) }
    static var initRectConfig:CGRect { return CGRect(0.2,0.2,0.2,0.2) }
    
}
