import Foundation

class Springer/*<T:ArithmeticKind>*/:BaseAnimation,PhysicsAnimationKind {
    /*Signatures*/
    //typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    //typealias InitValues = (value:T,targetValue:T,velocity:T,stopVelocity:T)
    //typealias Config = (spring:T,friction:T)
    /*Config values*/
    var initValues:InitValues//default: (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    var config:PhysicsAnimationKind.Config//default: (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    /*CallBack related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    init(_ callBack:@escaping FrameTick,  _ initValues:InitValues, _ config:Config) {
        self.initValues = initValues
        self.callBack = callBack
        self.config = config
        super.init()
    }
    
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
/**
 * Convenient when initializing
 */
extension Springer{
    
}
