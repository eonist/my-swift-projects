import Cocoa
/**
 * NOTE: this rubberBand tween is cheating a bit. The perfect way to implement this would be to add a half circle easing curve
 * NOTE: I think essentialy this is a 👉 SpringSolver 👈. You can find an example of the SpringSolvers in books and also in the facebook pop lib
 * PARAM: maskRect: represents the visible part of the content
 * PARAM: contentRect: represents the total size of the content
 * TODO: ⚠️️ Rename to ElasticSpringSolver? or ElasticBand? ElasticSpring? Elastic?
 * TODO: ⚠️️ Integrate temp values inside rubberband or make a tempvalue struct
 * NOTE: friction: This value is the strength of the friction when the item is floating freely
 * NOTE: springEasing: the easeOut effect on the spring (also known as the dampener)
 * NOTE: spring: the strength of the spring
 * NOTE: limit: the max distance the displacement friction like the effect can travle, the vertical limit is the distance where the value almost doesn't move at all while directly manipulating,the illusion that the surface under the thumb is slipping
 * NOTE: epsilon: twips 20th of a pixel
 */

class RubberBand:Mover{//TODO: rename to Elastic
    /*Initial values*/
    var maskFrame:Frame/*Represents the visible part of the content*/
    var contentFrame:Frame/*Represents the total size of the content*/
    var config:Config/*The init settings of the RubberbBand*/
    /*Interim values*/
    var result:CGFloat = 0/*Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside*/
    var hasStopped:Bool = true/*Indicates that the motion has stopped*///TODO: try to move this into the mover
    
    init(_ callBack:@escaping FrameTick,_ maskFrame:Frame, _ contentFrame:Frame,_ config:Config) {
        self.maskFrame = maskFrame
        self.contentFrame = contentFrame
        self.config = config
        super.init(AnimProxy.shared, callBack, 0, 0)
    }
    override func onFrame(){
        if hasStopped {/*stop the frameTicker here*/
            stop()/*<---never stop the CVDisplayLink before you start another. Since you can't start a CVDisplayLink within a CVDisplayLinkStart block*/
        }else{/*only move the view if the mover is not stopped*/
            updatePosition()/*tick the mover on every frame*/
            callBack(result)/*indirect manipulation aka momentum*/
        }
    }
    /**
     * While directly manipulating: Enforces the illusion that the surface is slipping the further you pull
     * NOTE: When in inderect motion: Springs back to it's limit
     * TODO: ⚠️️ Add a isDirectlyManipulating flag to the function arg instead of having a class scoped bool flag!?!?
     */
    override func updatePosition(_ direct:Bool = false) {
        if value > maskFrame.min {applyTopBoundary(direct)}/*the top of the item-container passed the mask-container top checkPoint*/
        else if (value + contentFrame.len) < maskFrame.len {applyBottomBoundary(direct)}/*the bottom of the item-container passed the mask-container bottom checkPoint*/
        else{/*within the Boundaries*/
            if !direct {/*Only apply friction and velocity when not directly manipulating the value*/
                applyFriction()
            }
            checkForStop(direct)/*Assert if the movement is close to stopping, if it is then stop it*/
            result = value
        }
    }
    /**
     * If you extract this code to a method 🚀, and then override it with the snapFriction equation, then it should work just like that!
     */
    func applyFriction(){
        velocity *= friction
        value += velocity
    }
}
extension RubberBand{
    static var defaultConfig:Config = (/*Constants*/
        friction:0.98,/*Degrades the velocity over time utill stop*/
        springEasing:0.2,
        spring:0.4,
        limit:100,
        epsilon:0.15/*When the velocity is bellow this value stop the animation*/
    )
    /**
     * When the min val reaches beyond max
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyTopBoundary(_ direct:Bool){/*Surface is slipping the further you pull*/
        //Swift.print("applyTopBoundary")
        let distToGoal:CGFloat = value - maskFrame.min
        if(direct){/*surface is slipping the further you pull*/
            result = maskFrame.min + CustomFriction.constrainedValueWithLog10(distToGoal,limit - maskFrame.min /*topMargin*/)//<--Creates the illusion that the surface under the thumb is slipping
        }else{/*Springs back to limit*/
            velocity -= (distToGoal * spring)
            velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
            value += velocity
            if value.isNear(maskFrame.min, 1) {checkForStop(direct)}
            result = value
        }
    }
    /**
     * When the max val reaches beyond the min
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyBottomBoundary(_ direct:Bool){
        //Swift.print("applyBottomBoundary")
        if direct {/*surface is slipping the further you pull*/
            let totLen = (contentFrame.len - maskFrame.len)/*tot length of items - length of mask*/
            let normalizedValue:CGFloat = totLen + value/*goes from 0 to -100*/
            result = -totLen + CustomFriction.constrainedValueWithLog10(normalizedValue,-limit)//<--Creates the illusion that the surface under the thumb is slipping
        }else{/*Springs back to limit*/
            let dist = maskFrame.len - (value + contentFrame.len)/*distanceToGoal*/
            velocity += (dist * spring)
            velocity *= springEasing
            value += velocity
            if dist.isNear(0, 1) {checkForStop(direct)}/*Checks if dist is near 0, with an epsilon of 1px*/
            result = value
        }
    }
    /**
     * When velocity is less than epsilon basically less than half of a twib 0.15. then set the hasStopped flag to true
     * NOTE: Basically stops listening for the onFrame event
     * PARAM: direct: toggles the directManipulation mode
     */
    func checkForStop(_ direct:Bool) {
        if !direct && CGFloatAsserter.isNear(velocity, 0, epsilon) {
            velocity = 0//⚠️️ quick fix, may break things, was added to be able to detect anim stop on bounce-back complete
            hasStopped = true
        }
    }
}

/*
 * Deprecations
 * TODO: you can probably uncomment the methods bellow
 */
extension RubberBand{
    //legacy
    convenience init(_ animatable:AnimProxyKind,_ callBack:@escaping FrameTick, _ maskFrame:Frame, _ contentFrame:Frame, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
        let config:Config = (friction,springEasing,spring,limit,0.15)
        self.init(callBack, maskFrame,contentFrame, config)
        /*self.velocity = velocity
         self.value = value*/
    }
    //DEPRECATED,Legacy support
    convenience init(_ animatable:AnimProxyKind,_ callBack:@escaping FrameTick, _ maskRect:CGRect, _ contentRect:CGRect, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
        self.init(animatable, callBack, (maskRect.y,maskRect.height),(contentRect.y,contentRect.height),value,velocity,friction,springEasing,spring,limit)
    }
    //DEPRECATED,Legacy support
    var frame:CGRect {get{return CGRect(0,maskFrame.min,0,maskFrame.len)}set{maskFrame = (newValue.y,newValue.height)}}
    //DEPRECATED,Legacy support
    var itemsRect:CGRect {get{return CGRect(0,contentFrame.min,0,contentFrame.len)}set{contentFrame = (newValue.y,newValue.height)}}
    //DEPRECATED
    var isDirectlyManipulating:Bool {get{fatalError("not supported anymore")}set{_ = newValue;fatalError("deprecated");}}/*toggles the directManipulation mode*/
}
extension RubberBand{/*Convenience accessors*/
    var friction:CGFloat {return config.friction}
    var springEasing:CGFloat {return config.springEasing}
    var spring:CGFloat {return config.spring}
    var limit:CGFloat {return config.limit}
    var epsilon:CGFloat {return config.epsilon}
}
