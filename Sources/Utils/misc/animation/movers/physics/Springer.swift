import Foundation

class Springer:BaseAnimation,PhysicsAnimationKind {
    typealias argType = CGFloat
    /*Signatures*/
    //typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    //typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    //typealias Config = (spring:T,friction:T)
    /*Config values*/
    var initValues:InitValues//(value:argType,targetValue:argType,velocity:argType,stopVelocity:argType)//default: (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    var config:(spring:argType,friction:argType)//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*CallBack related*/
    var callBack:(argType)->Void/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping (argType)->Void,  _ initValues:(value:argType,targetValue:argType,velocity:argType,stopVelocity:argType), _ config:(spring:argType,friction:argType)) {
        self.initValues = initValues
        self.callBack = callBack
        self.config = config
        super.init()
    }
    override func onFrame(){
        self.updatePosition()
        self.callBack(value)
    }
}

class PointSpringer:Springer,PhysicsAnimationKind{
    typealias argType = CGPoint
    
    func updatePosition(_ val:CGPoint) {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value = value + velocity
        if assertStop {stop()}
    }
}
/**
 * Convenient when initializing
 */
//protocol SpringKind:PhysicsAnimationKind{
    //var config:(spring:argType,friction:argType) {get set}
//}
