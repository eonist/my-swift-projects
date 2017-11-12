import Cocoa

protocol FrameAnimatable2{
    var animProxy:AnimProxyKind2 {get}
    func start()
    func stop()
    var stopped:Bool {get}
}
/**
 * FrameAnimator serves as the Core Animator in this Animation library
 * TODO: ⚠️️⚠️️⚠️️ Make a local stopped flag, so you dont have to itrate animProxy.animations so many times
 * NOTE: We use EventSender for in-frequent events such as onComplete or onStop and we use a regular callback method as its very frequent
 */
class FrameAnimator2:FrameAnimatable2 {/*Rename to FrameAnimator*/
    var animProxy:AnimProxyKind2/*Reference to where the displayLink resides*/
    init(_ animatable:AnimProxyKind2 = AnimProxy2.shared){
        self.animProxy = animatable
    }
    /**
     * This is called from the AnimProxy.onFrameOnMainThread method
     */
    func onFrameTick(){//TODO: ⚠️️ should be marked overridable
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        if stopped {/*Aka you dont have to start it if its already running*/
            animProxy.animators.append(self)/*Add your self to the list of animators that gets the onFrame call*/
            if(!CVDisplayLinkIsRunning(animProxy.displayLink)){CVDisplayLinkStart(animProxy.displayLink)}/*start the displayLink if it isn't already running*/
        }
    }
    /**
     * Stop the animation
     */
    func stop(){
        animProxy.animators.removeAt(animProxy.animators.indexOf(self))/*If none exist -1 is returned and none is removed*/
        if(animProxy.animators.isEmpty && CVDisplayLinkIsRunning(animProxy.displayLink)){CVDisplayLinkStop(animProxy.displayLink)}/*stops the frame ticker if there is no active running animators*/
    }
}
extension FrameAnimator2 {
    /**
     * Assert if an animator is active or not, you can also check if the Animator is nil to check if is active or not
     * TODO: ⚠️️ Name this hasStopped
     */
    var stopped:Bool {return animProxy.animators.indexOf(self) == -1}
}

