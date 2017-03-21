import Cocoa

class Mover:BaseAnimation {
    var value:CGFloat = 0/*the value that should be applied to the target*/
    var velocity:CGFloat
    init(_ animatable:IAnimatable, _ value:CGFloat, _ velocity:CGFloat = 0){
        self.value = value
        self.velocity = velocity
        super.init(animatable)
    }
    func updatePosition() {
        value += velocity
    }
    override func onFrame(){
        updatePosition()//new
    }
}
