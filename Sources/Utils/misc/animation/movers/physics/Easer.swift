import Foundation
/**
 * NOTE: This class was attempted with regular OOP but it was not scalable, every time you subclassed the BaseClass you would have setup all the var's again
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * TODO: ⚠️️ The math can be refactored if you add += *= to ArithmeticKind
 */
/*class Easer<T:ArithmeticKind>:BaseAnimation {
    /*Config values*/
    var easing:T//CGPoint(0.2,0.2)
    /*Interim values*/
    var targetValue:T /*Where value should go to*/
    var velocity:T/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:Springer.FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:T
    
    init(_ callBack:@escaping Springer.FrameTick,  _ easing:T , _ initVals:Springer.InitValues) {
        self.value = initVals.value/*Set the init value*/
        self.targetValue = initVals.targetValue
        self.velocity = initVals.velocity
        self.callBack = callBack
        self.easing = easing
        self.stopVelocity = initVals.stopVelocity
        super.init()
    }
    func updatePosition() {
        velocity = (targetValue - value) * easing
        value = value + velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
*/
