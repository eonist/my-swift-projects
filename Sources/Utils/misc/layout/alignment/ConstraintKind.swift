#if os(iOS)
import UIKit

protocol ConstraintKind:class{
    var anchor:(x:NSLayoutConstraint,y:NSLayoutConstraint)? {get set}
    var size:(w:NSLayoutConstraint,h:NSLayoutConstraint)? {get set}
}
extension ConstraintKind{
    /**
     * Convenient
     */
    func setConstraint(anchor:(x:NSLayoutConstraint,y:NSLayoutConstraint),size:(w:NSLayoutConstraint,h:NSLayoutConstraint)) {
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
extension UIView{
    typealias AnimComplete = ()-> Void
    typealias AnimUpdate = ()-> Void
    static func defaultOnComplete() {Swift.print("default anim completed closure")}
    /**
     * Animate
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
