import Foundation
/**
 * TODO: ⚠️️ ⚠️️ ⚠️️ consider removing stopVelocity or make it optional, you can increase epsilon to do the same job, etc
 
 */
struct AnimState5<T:Advancable5> {
    var value: T/*the current value of the animation*/ //TODO: ⚠️️ rename to initial
    var targetValue: T/*Where the value want to go*/ //TODO: ⚠️️ rename to target
    var velocity: T/*speed of the animation*/
    var stopVelocity: T/*usually when velocity reaches zero, but this can sometimes be other values, i.e you want to stop at velocity 0.2*/
    var epsilon: T
    init(_ value: T = T.defaults.value,_ targetValue: T = T.defaults.targetValue,_ velocity: T = T.defaults.velocity,_ stopVelocity:T = T.defaults.stopVelocity, _ epsilon:T = T.defaults.epsilon){
        self.value = value
        self.targetValue = targetValue
        self.velocity = velocity
        self.stopVelocity = stopVelocity
        self.epsilon = epsilon
    }
}
