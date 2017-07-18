import Foundation

class Springer<T:ArithmeticKind>:BaseAnimation,PhysicsAnimationKind {
    typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    typealias Config = (spring:T,friction:T)
    /*Config values*/
    var initValues:InitValues
    var config:Config//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*Interim values*/
    var targetValue:T /*Where value should go to*/
    var velocity:T/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var stopVelocity:T
    
    init(_ callBack:@escaping FrameTick,  _ config:Config , _ initValues:InitValues) {
        self.initValues = initValues
        self.value = initValues.value/*Set the init value*/
        self.targetValue = initValues.targetValue
        self.velocity = initValues.velocity
        self.stopVelocity = initValues.stopVelocity
        self.callBack = callBack
        self.config = config
        super.init()
    }
    func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
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

