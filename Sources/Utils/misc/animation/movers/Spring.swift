import Foundation

class Spring:BaseAnimation {
    
    //continue here:
        //consider using two springs for x and y, or making a spring that sets a point
        //also make a stop metod that stops the anim if the velocity goes bellow a number, also sets final point to target point etc
        //you can even make multiple spring classes or use generics to support point,size,cgfloat etc, or some other solution
    
    var spring:CGFloat = 0.02
    var friction:CGFloat = 0.95
    var targetX:CGFloat = 0
    var velocityX:CGFloat = 0/*velocity*/
 
    var value:CGFloat = 0/*the value that should be applied to the target*/

    var callBack:FrameTick/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick,_ value:CGFloat = 0, _ spring:CGFloat = 0.02, _ friction:CGFloat = 0.95){
        self.value = value
        self.spring = spring
        self.callBack = callBack
        super.init(animatable)
    }
    func updatePosition(_ direct:Bool = false) {
        let dx:CGFloat = targetX - value
        let ax:CGFloat = dx * spring
        velocityX += ax
        velocityX *= friction
        value += velocityX
    }
    override func onFrame(){
        updatePosition()
        callBack(value)
    }
}
