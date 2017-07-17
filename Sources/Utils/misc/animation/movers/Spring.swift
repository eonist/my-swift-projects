import Foundation

class Spring<T:NumberKind>:BaseAnimation {
    typealias FrameTick = (T)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    /*Config values*/
    var config:(spring:T,friction:T)
    /*Interim values*/
    var targetValue:T /*Where value should go to*/
    var velocity:T/*Velocity*/
    var value:T/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    
    
    var stopAssert:(T)->Bool
    
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick, config:(spring:T, friction:T)/* = (spring:0.02,friction:0.90)*/, _ value:T) {
        self.value = value/*Set the init value*/
        self.callBack = callBack
        self.config = config
        self.stopAssert = Spring.defaultStopAssert
        super.init(animatable)
    }
    func updatePosition() {
        let dx = (targetValue - value)
        let ax = dx * config.spring
        velocity = velocity + ax
        velocity = velocity * config.friction
        value = value + velocity
        checkForStop()
    }
    func checkForStop() {
        //Swift.print("velocity: " + "\(velocity)")
        
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
extension Spring{
    static func defaultStopAssert(_ velocity:T)->Bool {
        let velocity:CGFloat = velocity as! CGFloat
        return velocity.isNear(0, 10e-5)
    }
}
//Continue here:
    //Figure out FrameTick in gerics ✅
    //and add epsilon value to config and zero variable to test against, this differs from CGFloat and CGPoint etc
