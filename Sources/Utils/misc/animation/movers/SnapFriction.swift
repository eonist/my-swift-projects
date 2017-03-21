import Foundation

class SnapFriction:Friction {
    init(_ view:IAnimatable,  _ callBack:@escaping (CGFloat)->Void,_ value:CGFloat, _ velocity:CGFloat = 0, _ frictionStrength:CGFloat = 0.98, _ ){
        self.frictionStrength = frictionStrength
        super.init(view, callBack, value, velocity)
        
    }
    func applyFriction() {
        velocity *= frictionStrength
        velocity *= slowDownFriction/*ad-hock way to slow things down outside normal friction*/
    }
}
