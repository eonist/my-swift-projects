import Foundation
@testable import Utils
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 * TODO: ⚠️️ maskFrame.y must be 0 . untill you add support for it to be a value > 0 or < 0
 */
class ElasticEaser5:Easer5<CGRect> {
    var direct:Bool = false
    typealias Frame = (min:CGFloat,len:CGFloat)//TODO:rename to  boundries
    var maskFrame:Frame/*Represents the visible part of the content*/
    var contentFrame:Frame/*Represents the total size of the content*/
    var limit:CGFloat = 100
    //var result:AnimState5<T>/*Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside*/
    init(_ state:AnimState5<T>, _ easing:T,  _ contentFrame:Frame,_ maskFrame:Frame, _ onFrame:@escaping FrameTickSignature) {
        //self.result = state//set init result
        self.contentFrame = contentFrame
        self.maskFrame = maskFrame
        super.init(state,easing,onFrame)
    }
    override func updatePosition() {
        if direct {
            if value.y < maskFrame.min {
                Swift.print("applyTopBoundary")
                applyTopBoundary()
            }
            else if (value.y + contentFrame.len) > maskFrame.len {
                Swift.print("applyBottomBoundary")
                applyBottomBoundary()
            }else{
                super.updatePosition()
            }
        }else{
            super.updatePosition()
        }
    }
    /**
     * When the min val reaches beyond max
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyTopBoundary(){/*Surface is slipping the further you pull*/
        //Swift.print("applyTopBoundary")
        let distToGoal:CGFloat = -value.y /*- maskFrame.min*/
        if(direct){/*surface is slipping the further you pull*/
            //result = value
            value.y = maskFrame.min + CustomFriction.constraintValueWithLog(distToGoal,limit /*- maskFrame.min*/ /*topMargin*/)//<--Creates the illusion that the surface under the thumb is slipping
        }/*else{/*Springs back to limit*/
            velocity -= (distToGoal * spring)
            velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
            value += velocity
            if(value.isNear(maskFrame.min, 1)){checkForStop(direct)}
            result = value
        }*/
    }
    /**
     * When the max val reaches beyond the min
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyBottomBoundary(){
        //Swift.print("applyBottomBoundary")
        if(direct){/*surface is slipping the further you pull*/
            let totLen = (contentFrame.len - maskFrame.len)/*tot length of items - length of mask*/
            let normalizedValue:CGFloat = totLen + value.y/*goes from 0 to -100*/
            //result = value
            value.y = -totLen + CustomFriction.constraintValueWithLog(normalizedValue,-limit)//<--Creates the illusion that the surface under the thumb is slipping
        }/*else{/*Springs back to limit*/
            let dist = maskFrame.len - (value + contentFrame.len)/*distanceToGoal*/
            velocity += (dist * spring)
            velocity *= springEasing
            value += velocity
            if dist.isNear(0, 1) {checkForStop(direct)}/*Checks if dist is near 0, with an epsilon of 1px*/
            result = value
        }*/
    }
}
