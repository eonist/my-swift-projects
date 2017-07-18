import Foundation

class Springer:BaseAnimation,PhysicsAnimationKind {
    //typealias argType = CGFloat
    /*Signatures*/
    //typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    //typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    typealias Config = (spring:argType,friction:argType)
    /*Config values*/
    var initValues:(value:argType,targetValue:argType,velocity:argType,stopVelocity:argType)//default: (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    var config:Config//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*CallBack related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ config:Config) {
        self.initValues = initValues
        self.callBack = callBack
        self.config = config
        super.init()
    }
    override func onFrame(){
        self.updatePosition()
        self.callBack(value)
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
    static var initConfig:(CGFloat,CGFloat) {
        return (0.02,0.90)
    }
    static var defaultInitValues:(CGFloat,CGFloat,CGFloat,CGFloat){
        return (0,0,0,0)
    }
}

class PointSpringer:Springer{
    typealias argType = CGPoint
    /*override init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ config:Config) {
        super.init(callBack,initValues,config)
    }*/
    func updatePosition(_ val:CGPoint) {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value = value + velocity
        if assertStop {stop()}
    }
    override var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initPointConfig:(spring:CGPoint,friction:CGPoint) {
        return (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    }
    static var defaultInitPointValues:(value:CGPoint,targetValue:CGPoint,velocity:CGPoint,stopVelocity:CGPoint){
        return (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    }
}
/**
 * Convenient when initializing
 */
//protocol SpringKind:PhysicsAnimationKind{
    //var config:(spring:argType,friction:argType) {get set}
//}
