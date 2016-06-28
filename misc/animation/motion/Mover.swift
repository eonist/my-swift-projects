import Cocoa

class Mover:BaseAnimation {
    var value:CGFloat = 0/*the value that should be applied to the target*/
    var velocity:CGFloat
    init(_ view:IAnimatable, _ value:CGFloat, _ velocity:CGFloat = 0){
        self.value = value
        self.velocity = velocity
        super.init(view)
    }
    func updatePosition() {
        //Swift.print("\(self.dynamicType)" + "updatePosition")
        value += velocity;
    }
    override func onFrame(){
        //not implemented yet
    }
}