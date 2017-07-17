import Foundation

class Spring:BaseAnimation {
    /*Config values*/
    var spring:CGFloat
    var friction:CGFloat
    /*Interim values*/
    var targetValue:CGFloat = 0/*Where it should go*/
    var velocity:CGFloat = 0/*Velocity*/
    var value:CGFloat/*The value that should be applied to the target*/
    /*Event related*/
    var callBack:FrameTick/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick,_ value:CGFloat = 0, _ spring:CGFloat = 0.02, _ friction:CGFloat = 0.90){
        self.value = value/*Set the init value*/
        self.spring = spring
        self.callBack = callBack
        self.friction = friction
        super.init(animatable)
    }
    func updatePosition(_ direct:Bool = false) {
        let dx:CGFloat = targetValue - value
        let ax:CGFloat = dx * spring
        velocity += ax
        velocity *= friction
        value += velocity
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
