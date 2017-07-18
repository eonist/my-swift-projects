import Cocoa
/**
 * TODO: Consider not using EventSender in the animation lib and instead setup callbacks so that it can work standalone
 * NOTE: We use EventSender for in-frequent events such as onComplete or onStop and we use a regular callback method as its very frequent
 */
class BaseAnimation:EventSender,BaseAnimatable {
    var animatable:Animatable/*Reference to where the displayLink resides*/
    init(_ animatable:Animatable = Animation.sharedInstance){
        self.animatable = animatable
    }
    var onFrameTick:()->Void = {
        fatalError("Must be overwritten in subclass")
    }
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        animatable.animators.append(self)/*add your self to the list of animators that gets the onFrame call*/
        if(!CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStart(animatable.displayLink)}/*start the displayLink if it isn't already running*/
    }
    /**
     * Stop the animation
     */
    func stop(){
        animatable.animators.removeAt(animatable.animators.indexOf(self as? BaseAnimatable))
        if(animatable.animators.count == 0 && CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStop(animatable.displayLink)}/*stops the frame ticker if there is no active running animators*/
        super.onEvent(AnimEvent(AnimEvent.stopped,self))/*Notify listners the animation has stopped*/
    }
}
