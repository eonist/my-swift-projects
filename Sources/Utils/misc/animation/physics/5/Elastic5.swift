import Foundation
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 */
class Elastic5<T:Advancable5>:Easer5<T> {
    var direct:Bool = false
    typealias Frame = (min:T,len:T)
    var maskFrame:Frame/*Represents the visible part of the content*/
    override func updatePosition() {
        if direct {
            if value > maskFrame.min {applyTopBoundary()}
            else if((value + contentFrame.len) < maskFrame.len){applyBottomBoundary()}
        }else{
            super.updatePosition()
        }
        
    }
}
