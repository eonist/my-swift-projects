import Cocoa
/**
 * FrameAnimator serves as the Core Animator in this Animation library
 * TODO: ⚠️️ Consider not using EventSender in the animation lib and instead setup callbacks so that it can work standalone, also callbacks works better when setting up chaining
 * NOTE: We use EventSender for in-frequent events such as onComplete or onStop and we use a regular callback method as its very frequent
 */
class FrameAnimator:EventSender {//rename to FrameAnimator
    var animProxy:AnimProxyKind/*Reference to where the displayLink resides*/
    init(_ animatable:AnimProxyKind = AnimProxy.shared){
        self.animProxy = animatable
    }
    /**
     * This is called from the AnimProxy.onFrameOnMainThread method
     */
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        animProxy.animators.append(self)/*Add your self to the list of animators that gets the onFrame call*/
        if !CVDisplayLinkIsRunning(animProxy.displayLink) {CVDisplayLinkStart(animProxy.displayLink)}/*start the displayLink if it isn't already running*/
    }
    /**
     * Stop the animation
     */
    func stop(){
        animProxy.animators.removeAt(animProxy.animators.indexOf(self))/*If none exist -1 is returned and none is removed*/
        if animProxy.animators.isEmpty && CVDisplayLinkIsRunning(animProxy.displayLink){CVDisplayLinkStop(animProxy.displayLink)}/*stops the frame ticker if there is no active running animators*/
        super.onEvent(AnimEvent(AnimEvent.stopped,self))/*Notify listners the animation has stopped*/
    }
}
extension FrameAnimator {
    /**
     * Assert if an animator is active or not, you can also check if the Animator is nil to check if is active or not
     * TODO: ⚠️️ Name this hasStopped or isActive
     */
    var stopped:Bool {return animProxy.animators.indexOf(self) == -1}
}
