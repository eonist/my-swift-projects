import Foundation


class Easer2<T:Advancable>:FrameAnimator,PhysicsAnimKind2 {
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
        self.updatePosition(value)
        self.callBack(value)
    }
    func updatePosition<T:Advancable>(_ value:T) {
        let velocity = targetValue.substract(value).multiply(easing)
        value = value.add(velocity)
        if assertStop {stop()}
    }
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
}

protocol Advancable{
    associatedtype argType
    func add(_ value: argType) -> argType
    func substract(_ value: argType) -> argType
    func multiply(_ value: argType) -> argType
    func isNear(_ value:argType,_ epsilon:argType) -> Bool
}

extension CGFloat:Advancable{
    typealias argType = CGFloat
    func isNear(_ value: CGFloat, _ epsilon: CGFloat) -> Bool {
        return self.isNear(value, epsilon)
    }
    func multiply(_ value: CGFloat) -> CGFloat {
        return self * value
    }
    func substract(_ value: CGFloat) -> CGFloat {
        return self - value
    }
    func add(_ value: CGFloat) -> CGFloat {
        return self + value
    }
}
