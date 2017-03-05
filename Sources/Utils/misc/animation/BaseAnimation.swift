import Cocoa

class BaseAnimation:EventSender {
    var animatable:IAnimatable/*Reference to where the displayLink resides*/
    init(_ animatable:IAnimatable){
        self.animatable = animatable
    }
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        //Swift.print("\(self.dynamicType)" + " start")
        animatable.animators.append(self)/*add your self to the list of animators that gets the onFrame call*/
        if(!CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStart(animatable.displayLink)}/*start the displayLink if it isn't already running*/
    }
    /**
     * Stop the animation
     */
    func stop(){
        //Swift.print("\(self.dynamicType)" + " stop")
        animatable.animators.removeAt(animatable.animators.indexOf(self))
        if(animatable.animators.count == 0 && CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStop(animatable.displayLink)}/*stops the frame ticker if there is no active running animators*/
        super.onEvent(AnimEvent(AnimEvent.stopped,self))
    }
}
