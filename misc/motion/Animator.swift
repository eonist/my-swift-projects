/**
 * TODO: You can store the active animator instance count in the AnimatableView to know when to stop the cvdisplaylink
 * TODO: take a look at other animation libs
 * TODO: Add onComplete selector callback method on init and as a variable, do the same with method, use optional to assert if they exist or not
 * TODO: seek,reverse,repeate,autoRepeat
 */
class Animator{
    let fps:CGFloat = 60//this should be pulled from a device variable
    var view:AnimatableView//ref to where the displayLink recides
    var duration:CGFloat/*in seconds*/
    var from:CGFloat//from this value
    var to:CGFloat//to this value
    var method:(CGFloat)->Void//the closure method that changes the property
    var framesToEnd:CGFloat//totFrameCount
    var currentFrameCount:CGFloat = 0//curFrameCount
    var val:CGFloat
    //isActive used by the AnimatiableView to assert if an animator is active or not
    init(_ view:AnimatableView, _ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ method:(CGFloat)->Void){
        self.view = view
        self.duration = duration
        self.from = from
        self.to = to
        self.method = method
        framesToEnd = fps * duration
        val = from
    }
    /**
     * Fires on every frame tick
     */
    func onFrame(){
        Swift.print("onFrame()")
        //var val:CGFloat = NumberParser.interpolate(from, to, currentFrameCount / framesToEnd)//interpolates the value
        //val += Easing.easeOut(val, from, to)
        val = Easing.easeInSine(currentFrameCount, from, to-from, framesToEnd)
        Swift.print("val: " + "\(val)")
        method(val)//call the property method
        if(currentFrameCount == framesToEnd){
            Swift.print("end of anim")/*when the count becomes 0 the frame ticker stops*/
            stop()
        }
        self.currentFrameCount++
        //call the method here
        //the method should be posible to be created as a inline method closure
    }
    /**
     * Start the animation
     */
    func start(){
        Swift.print("start")
        if(!CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStart(view.displayLink)}//start the displayLink if it isnt already running
        view.animators.append(self)//add your self to the list of animators that gets the onFrame call
    }
    /**
     * Stop the animation
     */
    func stop(){
        Swift.print("stop")
        view.animators.removeAt(view.animators.indexOf(self))
        if(view.animators.count == 0 && CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStop(view.displayLink)}//stops the frame ticker if there is not active running animators
    }
    //pause
    //resume
}