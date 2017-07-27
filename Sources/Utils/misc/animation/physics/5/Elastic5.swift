import Foundation
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 */
class Elastic5:Easer5<CGRect> {
    var direct:Bool = false
    typealias Frame = (min:CGFloat,len:CGFloat)//TODO:rename to  boundries
    var maskFrame:Frame/*Represents the visible part of the content*/
    var contentFrame:Frame/*Represents the total size of the content*/
    var limit:CGFloat = 100
    var result:CGFloat = 0/*Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside*/
    init(_ state:AnimState5<T>, _ easing:T, _ maskFrame:Frame, _ contentFrame:Frame, _ onFrame:@escaping FrameTickSignature) {
        self.maskFrame = maskFrame
        self.contentFrame = contentFrame
        super.init(state,easing,onFrame)
    }
    override func updatePosition() {
        if direct {
            if value.y > maskFrame.min {
                applyTopBoundary()
            }
            else if((value.y + contentFrame.len) < maskFrame.len){
                //applyBottomBoundary()
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
        let distToGoal:CGFloat = value.y - maskFrame.min
        if(direct){/*surface is slipping the further you pull*/
            result = maskFrame.min + CustomFriction.constraintValueWithLog(distToGoal,limit - maskFrame.min /*topMargin*/)//<--Creates the illusion that the surface under the thumb is slipping
        }else{/*Springs back to limit*/
            velocity -= (distToGoal * spring)
            velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
            value += velocity
            if(value.isNear(maskFrame.min, 1)){checkForStop(direct)}
            result = value
        }
    }
}
