import Foundation

class Springer<T>:BaseAnimation,PhysicsAnimationKind {
   

    //typealias argType = T
    /*Signatures*/
    //typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    //typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    //typealias Config = (spring:T,friction:T)
    /*Config values*/
    var initValues:(value:T,targetValue:T,velocity:T,stopVelocity:T)//default: (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    var config:(spring:T,friction:T)//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*CallBack related*/
    var callBack:(T)->Void/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping (T)->Void,  _ initValues:(value:T,targetValue:T,velocity:T,stopVelocity:T), _ config:(spring:T,friction:T)) {
        self.initValues = initValues
        self.callBack = callBack
        self.config = config
        super.init()
    }
    override func onFrame(){
        //self.updatePosition(value)
        self.callBack(value)
    }
}
/**
 * Convenient when initializing
 */
//protocol SpringKind:PhysicsAnimationKind{
    //var config:(spring:argType,friction:argType) {get set}
//}
