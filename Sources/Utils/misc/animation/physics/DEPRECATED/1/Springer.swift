import Foundation
/**
 * That Springer class
 */
class Springer<T>: FrameAnimator,PhysicsAnimationKind{
    typealias argType = T
    typealias Config = (spring:argType,friction:argType)/*Signatures*/
    var initValues:InitValues
    var config:Config/*Config values*/
    var callBack:FrameTickSignature
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
        fatalError("Must be overriden in subClass")
    }
}
/**
 * Springer for CGFloat
 */
class NumberSpringer:Springer<CGFloat> {
    override func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity += a
        velocity *= config.friction
        value +=  velocity
        if assertStop {value = targetValue;stop()}//new: sets the final value
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-9.cgFloat)//the epsilon was increased from -5 to -9
    }
    static var initConfig:Config {/*Convenient default init values*/
        return (spring:0.02,friction:0.90)
    }
    static var initValues:InitValues{/*Convenient default init values*/
        return (value:0,targetValue:0,velocity:0,stopVelocity:0)
    }
}
/**
 * Springer for CGPoint
 */
class PointSpringer:Springer<CGPoint> {
    override func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity +=  a
        velocity *=  config.friction
        value += velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initConfig:Config {/*Convenient default init values*/
        return (spring:CGPoint(0.02,0.02),friction:CGPoint(0.90,0.90))
    }
    static var initValues:InitValues{/*Convenient default init values*/
        return (value:CGPoint(0,0),targetValue:CGPoint(0,0),velocity:CGPoint(0,0),stopVelocity:CGPoint(0,0))
    }
}

