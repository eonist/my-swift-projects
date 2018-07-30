#if os(iOS)
import UIKit

typealias SizeConstraint = (w:NSLayoutConstraint,h:NSLayoutConstraint)
typealias AnchorConstraint = (x:NSLayoutConstraint,y:NSLayoutConstraint)

protocol ConstraintKind:class{
    var anchor:AnchorConstraint? {get set}
    var size:SizeConstraint? {get set}
}
extension ConstraintKind{
    /**
     * Convenient
     */
    func setConstraint(anchor:AnchorConstraint,size:SizeConstraint) {
        self.anchor = anchor
        self.size = size
    }
}
/**
 * Animation
 */
extension ConstraintKind where Self:UIView{
    /**
     * Animates a UIView that adhers to ConstraintKind (hor)
     */
    func animate(to:CGFloat, align:HorizontalAlign, alignTo:HorizontalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        UIView.animate({self.update(offset: to, align: align, alignTo: alignTo)},onComplete:onComplete)
    }
    /**
     * Anim for ver
     */
    func animate(to:CGFloat, align:VerticalAlign = .top, alignTo:VerticalAlign = .top, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
        UIView.animate({self.update(offset: to, align: align, alignTo: alignTo)},onComplete:onComplete)
    }
}
/**
 * Animation (Static & convenient)
 */
extension UIView{
    typealias AnimComplete = () -> Void
    typealias AnimUpdate = () -> Void
    static func defaultOnComplete() {Swift.print("default anim completed closure")}
    /**
     * Animate
     * Example:
     */
    static func animate(_ onUpdate:@escaping AnimUpdate,onComplete:@escaping AnimComplete = UIView.defaultOnComplete){
        let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
            onUpdate()
        })
        anim.addCompletion{_ in onComplete() }
        anim.startAnimation()
    }
}
#endif
