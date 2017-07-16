import Foundation

class Spring:BaseAnimation {
    
    var spring:CGFloat = 0.02
    var friction:CGFloat = 0.95
    var targetX:CGFloat = 0
    var vx:CGFloat = 0/*velocity*/
 
    var value:CGFloat = 0/*the value that should be applied to the target*/

    var callBack:FrameTick/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick,_ value:CGFloat, _ spring:CGFloat = 0.02, _ friction:CGFloat = 0.95){
        self.value = value
        self.spring = spring
        self.callBack = callBack
        super.init(animatable)
    }
    func updatePosition(_ direct:Bool = false) {
        let dx:CGFloat = targetX - value
        let ax:CGFloat = dx * spring
        vx += ax
        vx *= friction
        value += vx
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
