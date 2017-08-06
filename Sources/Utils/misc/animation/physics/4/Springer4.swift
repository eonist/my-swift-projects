import Foundation
/**
 * Base class That Springer classes itcan subClass
 */
/*
class Springer4<T:Advancable4>:Easer4<T> {
    typealias Config = (spring:T,friction:T)/*Signatures*/
    var config:Config/*Config values*/
    init(_ initValues:Easer4<T>.InitValues, _ config:Config,_ callBack:@escaping Easer4<T>.FrameTickSignature) {
        self.config = config
        super.init(initValues,config.spring,callBack)
    }
    override func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value =  value + velocity
        if assertStop {
            state.value = state.targetValue//set the final value
            stop()
        }
    }
}
 */
/*Convenient default init values*/
/*
var initSpringerConfig:Springer4<CGFloat>.Config = (0.02,0.90)
var initPointSpringerConfig:Springer4<CGPoint>.Config = (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
   
*/
