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
    init(_ value: T = T.defaults.value,_ targetValue: T = T.defaults.targetValue,_ velocity: T = T.defaults.velocity,_ stopVelocity:T = T.defaults.stopVelocity, _ epsilon:T = T.defaults.epsilon){
        self.value = value
        self.targetValue = targetValue
        self.velocity = velocity
        self.stopVelocity = stopVelocity
        self.epsilon = epsilon
    }
}