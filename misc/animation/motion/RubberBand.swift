import Cocoa
/**
 * NOTE: this rubberBand tween is cheating a bit. The perfect way to implement this would be to add a half circle easing curve
 * NOTE: I think essentialy this is a SpringSolver. YOu can find an example of the SpringSolver in books and also in facebook pop
 * TODO: move these clases into the motion folder in swift-utils
 */
class RubberBand:Mover{
    let epsilon:CGFloat = 0.15/*twips 20th of a pixel*/
    var result:CGFloat = 0/*output value*/
    var hasStopped:Bool = true/*indicates that the motion has stopped*/
    var isDirectlyManipulating:Bool = false/*toggles the directManipulation mode*/
    var frame:CGRect/*represents the visible part of the content*/
    var itemRect:CGRect/*represents the total size of the content*/
    var friction:CGFloat/*This value is the strength of the friction when the item is floating freely*/
    var springEasing:CGFloat/*the easeOut effect on the spring*/
    var spring:CGFloat/*the strength of the spring*/
    var limit:CGFloat/*the max distance the displacement friction like effect can travle*/
    var view:RBSliderList/*<--this should not be here, you need to disjoint this ref from this class*/
    init(_ view:RBSliderList, _ frame:CGRect, _ itemRect:CGRect, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
        self.frame = frame
        self.itemRect = itemRect
        self.friction = friction
        self.springEasing = springEasing
        self.spring = spring
        self.limit = limit
        self.view = view
        super.init(Animation.sharedInstance, value, velocity)
    }
    override func updatePosition() {
        applyBoundries()/*assert if the movement is close to stopping, if it is then stop it*/
    }
    override func onFrame(){
        //Swift.print("RBSliderList.onFrame")
        if(hasStopped){//stop the frameTicker here
            //CVDisplayLinkStop(displayLink)
            
            (view).slider?.thumb?.fadeOut()
            stop()//<---never stop the CVDisplayLink before you start another. Since you cant start a CVDisplayLink within a CVDisplayLinkStart block
        }else{//only move the view if the mover is not stopped
            updatePosition()/*tick the mover*/
            (view).setProgress(result)/*indirect manipulation aka momentum*/
        }
        //super.onFrame()
    }
    func applyBoundries() {
        if(value > frame.y){applyTopBoundry()}/*the top of the item-container passed the mask-container top checkPoint*/
        else if((value + itemRect.height) < frame.height){applyBottomBoundry()}/*the bottom of the item-container passed the mask-container bottom checkPoint*/
        else{/*within the boundries*/
            if(!isDirectlyManipulating){//only apply friction and velocity when not directly manipulating the value
                velocity *= friction
                value += velocity
            }
            checkForStop()
            result = value
        }
    }
    func applyTopBoundry(){
        let distToGoal:CGFloat = value
        if(isDirectlyManipulating){
            result = CustomFriction.constraintValueWithLog(distToGoal,100)
        }else{
            velocity -= (distToGoal * spring)
            velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
            value += velocity
            if(NumberAsserter.isNear(value, 0, 1)){checkForStop()}
            result = value
        }
    }
    func applyBottomBoundry(){
        if(isDirectlyManipulating){
            let totHeight = (itemRect.height - frame.height)//(tot height of items - height of mask)
            let normalizedValue:CGFloat = totHeight + value/*goes from 0 to -100*/
            result = -totHeight + CustomFriction.constraintValueWithLog(normalizedValue,-100)
        }else{
            let dist = frame.height - (value + itemRect.height)/*distanceToGoal*/
            velocity += (dist * spring)
            velocity *= springEasing
            value += velocity
            if(NumberAsserter.isNear(dist, 0, 1)){checkForStop()}/*checks if dist is near 0, with an epsilon of 1px*/
            result = value
        }
    }
    /*
     * When velocity is less than epsilon basically less than half of a twib 0.15. then set the hasStopped flag to true
     * NOTE: Basically stops listening for the onFrame event
     */
    func checkForStop() {
        //Swift.print( "\(value.toFixed(3))" + " checkForStop " + "\((lastValue).toFixed(3))")
        if(!isDirectlyManipulating && NumberAsserter.isNear(velocity, 0, epsilon)) {
            //Swift.print("stop velocity: " + "\(velocity)")
            hasStopped = true
        }
    }
}
private class CustomFriction{//creates the displacement friction effect. Like you finger is slightly losing its grip
    /**
     * NOTE: the vertical limit is the point where the value almost doesnt move at all
     * NOTE: This metod also works with negative values. Just make sure that borth the value and the limit is negative.
     */
    class func constraintValueWithLog(value : CGFloat, _ limit:CGFloat) -> CGFloat {
        let multiplier = (log10(1.0 + value/limit))
        //Swift.print("multiplier: " + "\(multiplier)" + " yPosition: " + "\(yPosition)")
        return limit * multiplier
    }
    /**
     * NOTE: If you decrease the decimal variable you increase the friction effect
     */
    class func constraintValue(value : CGFloat, _ limit:CGFloat) -> CGFloat {
        let multiplier = (0.2 * (value/limit))
        return limit * multiplier
    }
}