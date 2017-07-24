import Foundation

class Springer4<T: Advancable4>:Easer4 {
    typealias Config = (spring:T,friction:T)/*Signatures*/
    var config:Config/*Config values*/
    init(_ initValues:InitValues, _ config:Config,_ callBack:@escaping FrameTickSignature) {
        self.config = config
        super.init()
    }
    override func updatePosition() {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity += a
        velocity *= config.friction
        value +=  velocity
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
