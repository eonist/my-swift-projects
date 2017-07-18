import Foundation

class Springer<T:ArithmeticKind>:BaseAnimation,PhysicsAnimationKind {
    /*Signatures*/
    typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    typealias Config = (spring:T,friction:T)
    /*Config values*/
    var initValues:InitValues//default: (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    var config:Config//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping FrameTick,  _ initValues:InitValues, _ config:Config) {
        self.initValues = initValues
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
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
    
    static var initPointConfig:(spring:CGPoint,friction:CGPoint) {
        return (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    }
    static var initConfig:(CGFloat,CGFloat) {
        return (0.02,0.90)
    }
    static var defaultInitPointValues:(CGPoint,CGPoint,CGPoint,CGPoint){
        return (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    }
    static var defaultInitValues:(CGFloat,CGFloat,CGFloat,CGFloat){
        return (0,0,0,0)
    }
}
/**
 * Convenient when initializing
 */
extension Springer{
    
}
