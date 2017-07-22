import Cocoa

class Mover:FrameAnimator {
    var value:CGFloat = 0/*the value that should be applied to the target*/
    var velocity:CGFloat/*The amount increased on each frame-tick of the animation*/
    var callBack:FrameTick/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:AnimProxyKind, _ callBack:@escaping FrameTick,_ value:CGFloat, _ velocity:CGFloat = 0){
        self.value = value
        self.velocity = velocity
        self.callBack = callBack
        super.init(animatable)
    }
    func updatePosition(_ direct:Bool = false) {
        value += velocity
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
