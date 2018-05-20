#if os(iOS)
import UIKit

protocol ConstraintKind:class{
    var anchor:(x:NSLayoutConstraint,y:NSLayoutConstraint)? {get set}
    var size:(w:NSLayoutConstraint,h:NSLayoutConstraint)? {get set}
}

/**
 * Animation
 */
extension ConstraintKind where Self:UIView{
    typealias AnimComplete = ()-> Void
    static func defaultOnComplete() {Swift.print("default anim completed closure")}
    /**
     * Animates a UIView that adhers to ConstraintKind (hor)
     */
    func animate(to:CGFloat, align:HorizontalAlign = .left, alignTo:HorizontalAlign = .left, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.update(offset: to, align: align, alignTo: alignTo)// Set the new constraints
        })
        anim.addCompletion{_ in onComplete() }
        anim.startAnimation()
    }
    /**
     * Anim for ver
     */
    func animate(to:CGFloat, align:VerticalAlign, alignTo:VerticalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            self.update(offset: to, align: align, alignTo: alignTo)// Set the new constraints
        })
        anim.addCompletion{_ in onComplete() }
        anim.startAnimation()
    }
}
#endif
