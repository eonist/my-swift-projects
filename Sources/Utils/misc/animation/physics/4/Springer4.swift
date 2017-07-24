import Foundation

class Springer4<T:Advancable4>:Easer4<T> {
    typealias Config = (spring:T,friction:T)/*Signatures*/
    var config:Config/*Config values*/
    init(_ initValues:Easer4.InitValues, _ config:Config,_ callBack:@escaping Easer4<T>.FrameTickSignature) {
        self.config = config
        super.init(initValues,config,config.spring,callBack)
    }
    override func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value =  value + velocity
        if assertStop {stop()}
    }
}
/*Convenient*/
var initPointSpringConfig:(spring:CGPoint,friction:CGPoint) {/*Convenient default init values*/
    return (spring:CGPoint(0.02,0.02),friction:CGPoint(0.90,0.90))
}
var initSpringerConfig:(spring:CGFloat,friction:CGFloat) {/*Convenient default init values*/
    return (spring:0.02,friction:0.90)
}
