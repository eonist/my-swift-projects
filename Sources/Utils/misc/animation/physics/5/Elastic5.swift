import Foundation
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 */
class Elastic5<T:Advancable5>:Easer5<T> {
    var direct:Bool = false
    typealias Frame = (min:CGFloat,len:CGFloat)//TODO:rename to  boundries
    var maskFrame:Frame/*Represents the visible part of the content*/
    var contentFrame:Frame/*Represents the total size of the content*/
    init(_ state:AnimState5<T>, _ easing:T, _ maskFrame:Frame, _ contentFrame:Frame, _ onFrame:@escaping FrameTickSignature) {
        self.state = state
        self.onFrame = onFrame
        self.easing = easing
        self.maskFrame = maskFrame
        self.contentFrame = contentFrame
        super.init(state,easing,onFrame)
    }
    override func updatePosition() {
        if direct {
            if value > maskFrame.min {applyTopBoundary()}
            else if((value + contentFrame.len) < maskFrame.len){applyBottomBoundary()}
        }else{
            super.updatePosition()
        }
        
    }
}
