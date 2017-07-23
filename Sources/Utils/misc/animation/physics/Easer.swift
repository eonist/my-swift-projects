import Foundation
/**
 * NOTE: This class was attempted with regular OOP but it was not scalable, every time you subclassed the BaseClass you would have setup all the var's again
 * NOTE: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * NOTE: This is the Base class
 */
class Easer<T>:FrameAnimator,PhysicsAnimationKind {
    typealias argType = T
    var easing:argType
    var initValues:InitValues
    var callBack:FrameTickSignature
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ easing:argType) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()    
    }
    override func onFrame(){
        self.updatePosition()
        self.callBack(value)
    }
    func updatePosition() {
        fatalError("Must be overriden in subClass")
    }
}
/**
 * Easer for CGFloat
 */
class NumberEaser:Easer<CGFloat> {
    override func updatePosition() {
        velocity = (targetValue - value) * easing
        value += velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initConfig:CGFloat = (0.2)/*Convenient*/
    static var initValues:InitValues = (0,0,0,0)/*Convenient*/
}
/**
 * Easer for CGPoint
 */
class PointEaser:Easer<CGPoint> {
    override func updatePosition() {
        velocity = (targetValue - value) * easing
        value = value + velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initConfig:CGPoint = CGPoint(0.2,0.2)/*Convenient*/
    static var initValues:InitValues = (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))/*Convenient*/
}

protocol Easable{
    //
}
