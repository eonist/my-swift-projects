import Cocoa
/**
 * This class animates something from A to B with a easing curve attached
 * NOTE: This animation class is more like stock animation, less interuptable than "physics based animation"
 * TODO: ⚠️️ You can store the active animator instance count in the AnimProxy to know when to stop the cvdisplaylink
 * TODO: ⚠️️ Take a look at other animation libs 👈
 * TODO: ⚠️️ Add onComplete selector callback method on init and as a variable, do the same with method, use optional to assert if they exist or not
 * TODO: ⚠️️ Seek,reverse,repeate,autoRepeat
 * TODO: ⚠️️ Implement a way so that the animator can be reused so that you can target it and disable it
 * TODO: ⚠️️ Unify the variables and the init method
 */
typealias FrameTick = (CGFloat)->Void/*the callBack signature for onFrame ticks*/
extension Animator {
    
}
class Animator:BaseAnimation{
    let fps:CGFloat = 60//<--TODO: ⚠️️ this should be derived from a device variable
    var duration:CGFloat {get{return initValues.duration}set{initValues.duration = newValue}}/*In seconds*/
    var from:CGFloat {get{return initValues.from}set{initValues.from = newValue}}/*From this value*/
    var to:CGFloat {get{return initValues.to}set{initValues.to = newValue}}/*To this value*/
    var callBack:FrameTick/*The closure method that is called on every "frame-tick" and that changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    var framesToEnd:CGFloat {return fps * duration}/*totFrameCount*/
    var currentFrameCount:CGFloat = 0/*curFrameCount*///TODO:⚠️️ what is this?
    var easing:EasingEquation/*Variable for holding the easing method*/
    //isActive used by the AnimatiableView to assert if an animator is active or not, you can also check if the Animator is nil to check if is active or not
    
    typealias InitValues = (duration:CGFloat,from:CGFloat,to:CGFloat)
    var initValues:InitValues
    init(onFrame:@escaping FrameTick, initValues:InitValues, easing:EasingEquation){
        //derive the AnimProxy here
        //write getters and setters for the initValues
        //move the cur init to a convenient init inside an extension
        super.init(AnimProxy.sharedInstance)
    }
    
    convenience init(_ animatable:AnimProxyKind, _ duration:CGFloat = 0.5, _ from:CGFloat, _ to:CGFloat, _ callBack:@escaping FrameTick, _ easing:@escaping EasingEquation = Linear.ease){
        let initValues:InitValues = (duration:duration,from:from,to:to)
        self.init(onFrame: callBack, initValues: initValues, easing: easing)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrame(){
        let val:CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
        callBack(val)
        if(currentFrameCount == framesToEnd){
            stop()
            super.onEvent(AnimEvent(AnimEvent.completed,self))
        }
        self.currentFrameCount += 1
    }
}
