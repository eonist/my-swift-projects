import Cocoa

class Mover:BaseAnimation {
    var value:CGFloat = 0/*the value that should be applied to the target*/
    var velocity:CGFloat
    var callBack:(CGFloat)->Void/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:IAnimatable, _ callBack:@escaping (CGFloat)->Void,_ value:CGFloat, _ velocity:CGFloat = 0){
        self.value = value
        self.velocity = velocity
        self.callBack = callBack
        super.init(animatable)
    }
    func updatePosition() {
        value += velocity
    }
    override func onFrame(){
        updatePosition()//new
        callBack(value)//new
    }
}
