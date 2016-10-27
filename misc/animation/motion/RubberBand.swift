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
    var itemsRect:CGRect/*represents the total size of the content*/
    var friction:CGFloat/*This value is the strength of the friction when the item is floating freely*/
    var springEasing:CGFloat/*the easeOut effect on the spring*/
    var spring:CGFloat/*the strength of the spring*/
    var limit:CGFloat/*the max distance the displacement friction like effect can travle, the vertical limit is the distance where the value almost doesn't move at all while directly manipulating,the illusion that the surface under the thumb is slipping*/
    var view:RBSliderList/*<--this should not be here, you need to uncouple this ref from this class,rather use a callback method*/
    var topMargin:CGFloat = 0
    init(_ view:RBSliderList, _ frame:CGRect, _ itemRects:CGRect, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
        self.frame = frame
        self.itemsRect = itemRects
        self.friction = friction
        self.springEasing = springEasing
        self.spring = spring
        self.limit = limit
        self.view = view
        super.init(Animation.sharedInstance, value, velocity)
    }
    override func updatePosition() {
        applyBoundaries()/*assert if the movement is close to stopping, if it is then stop it*/
    }
    override func onFrame(){
        //Swift.print("RBSliderList.onFrame")
        if(hasStopped){//stop the frameTicker here
            //CVDisplayLinkStop(displayLink)
            view.slider?.thumb?.fadeOut()//<--this should be handled through an Event
            stop()//<---never stop the CVDisplayLink before you start another. Since you can't start a CVDisplayLink within a CVDisplayLinkStart block
        }else{//only move the view if the mover is not stopped
            updatePosition()/*tick the mover*/
            view.setProgress(result)/*indirect manipulation aka momentum*/
        }
    }
    /**
     * While directly manipulating: Enforces the illusion that the surface is slipping the further you pull
     * When in inderect motion: Springs back to its limit
     */
    func applyBoundaries() {
        if(value > frame.y + topMargin){applyTopBoundary()}/*the top of the item-container passed the mask-container top checkPoint*/
        else if((value + itemsRect.height) < frame.height){applyBottomBoundary()}/*the bottom of the item-container passed the mask-container bottom checkPoint*/
        else{/*within the Boundaries*/
            if(!isDirectlyManipulating){/*only apply friction and velocity when not directly manipulating the value*/
                velocity *= friction
                value += velocity
            }
            checkForStop()
            result = value
        }
    }
    
    //Continue here: add topMargin to frame.y
    
    func applyTopBoundary(){/*surface is slipping the further you pull*/
        Swift.print("applyTopBoundary() value: " + "\(value)")
        let distToGoal:CGFloat = value
        if(isDirectlyManipulating){/*surface is slipping the further you pull*/
            //Continue here: somehow figure out how to match the bellow value..
            //to where the list is located when in refresh mode
            result = topMargin + CustomFriction.constraintValueWithLog(distToGoal - topMargin,limit - topMargin)//<--Creates the illusion that the surface under the thumb is slipping
        }else{/*springs back to limit*/
            velocity -= ((distToGoal-topMargin) * spring)
            velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
            value += velocity
            if(value.isNear(topMargin, 1)){checkForStop()}
            result = value
        }
    }
    func applyBottomBoundary(){
        Swift.print("applyBottomBoundary()")
        if(isDirectlyManipulating){/*surface is slipping the further you pull*/
            let totHeight = (itemsRect.height - frame.height)//(tot height of items - height of mask)
            let normalizedValue:CGFloat = totHeight + value/*goes from 0 to -100*/
            result = -totHeight + CustomFriction.constraintValueWithLog(normalizedValue,-limit)//<--Creates the illusion that the surface under the thumb is slipping
        }else{/*springs back to limit*/
            let dist = frame.height - (value + itemsRect.height)/*distanceToGoal*/
            velocity += (dist * spring)
            velocity *= springEasing
            value += velocity
            if(dist.isNear(0, 1)){checkForStop()}/*checks if dist is near 0, with an epsilon of 1px*/
            result = value
        }
    }
    /**
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
     * NOTE: the vertical limit is the point where the value almost doesn't move at all
     * NOTE: This metod also works with negative values. Just make sure that both the value and the limit is negative.
     */
    class func constraintValueWithLog(value : CGFloat, _ limit:CGFloat) -> CGFloat {
        let multiplier = log10(1.0 + value/limit)
        //Swift.print("multiplier: " + "\(multiplier)" + " yPosition: " + "\(yPosition)")
        return limit * multiplier
    }
    /**
     * NOTE: If you decrease the decimal variable you increase the friction effect
     */
    class func constraintValue(value : CGFloat, _ limit:CGFloat) -> CGFloat {
        let multiplier = 0.2 * (value/limit)
        return limit * multiplier
    }
}