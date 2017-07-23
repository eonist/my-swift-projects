import Foundation


class Easer2<T:Advancable>:FrameAnimator,PhysicsAnimationKind {
    typealias argType = T
    var easing:argType
    var initValues:InitValues
    var callBack:FrameTickSignature
    init(_ callBack:@escaping FrameTickSignature,  _ initValues:InitValues, _ easing:argType) {
        self.initValues = initValues
        self.callBack = callBack
        self.easing = easing
        super.init()
    }
    override func onFrame(){
        self.updatePosition()
        self.callBack(value)
    }
    func updatePosition() {
        velocity = (targetValue - value) * easing
        value += velocity
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}

protocol Advancable{
    associatedtype argType
    func add(value: argType) -> argType
    func substract(value: argType) -> argType
    func multiply(value: argType) -> argType
    func isNear(value:argType,epsilon:argType) -> Bool
}

extension CGFloat:Advancable{
    typealias argType = CGFloat
    func isNear(value: CGFloat, epsilon: CGFloat) -> Bool {
        return self.isNear(value, epsilon)
    }
    func multiply(value: CGFloat) -> CGFloat {
        return self * value
    }
    func substract(value: CGFloat) -> CGFloat {
        return self - value
    }
    func add(value: CGFloat) -> CGFloat {
        return self + value
    }
}
