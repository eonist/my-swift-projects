import Cocoa

class Friction:Mover{
    var frictionStrength:CGFloat/*This value is the strength of the friction*/
    var lastValue:CGFloat = 0/*this value is a temporary value that is used when checking if the motion is about to stop*/
    var slowDownFriction:CGFloat = 1/*slowDownFriction is basically an inactive friction value, unless you change it to something else than 1, this variable can also be named easing*/
    var hasStopped:Bool = true
    init(_ view:IAnimatable,  _ callBack:@escaping (CGFloat)->Void,_ value:CGFloat, _ velocity:CGFloat = 0, _ frictionStrength:CGFloat = 0.98){
        self.frictionStrength = frictionStrength
        super.init(view, callBack, value, velocity)
        
    }
    override func updatePosition() {
        super.updatePosition()
        applyFriction()/*apply friction for every frame called*/
        checkForStop()/*assert if the movement is close to stopping, if it is then stop it*/
    }
    func applyFriction() {
        velocity *= frictionStrength;
        velocity *= slowDownFriction;/*ad-hock way to slow things down outside normal friction*/
    }
    /**
     * Basically stops listening for the onFrame event
     */
    func checkForStop() {
        //Swift.print( "\(value.toFixed(3))" + " checkForStop " + "\((lastValue).toFixed(3))")
        if(value.toFixed(3) == lastValue.toFixed(3)) {//this could be easier solved with a epsilon value assert
            Swift.print("stop")
            hasStopped = true
            stop()//new
        }
        lastValue = value
    }
}
