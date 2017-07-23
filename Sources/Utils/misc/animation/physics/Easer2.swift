import Foundation


class Easer2<T>:FrameAnimator,PhysicsAnimationKind {
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
        fatalError("Must be overriden in subClass")
    }
}

protocol Advanceable{
    associatedtype argType
    func add(x: argType, y: argType) -> argType
    func substract(x: argType, y: argType) -> argType
    func multiply(x: argType, y: argType) -> argType
    func isNear(a:argType,b:argType,epsilon:argType) -> Bool
}

extension CGFloat:Advanceable{
    typealias argType = CGFloat
    func isNear(a: CGFloat, b: CGFloat, epsilon: CGFloat) -> Bool {
        return a.isNear(b, epsilon)
    }
    func multiply(x: CGFloat, y: CGFloat) -> CGFloat {
        return x * y
    }
    func substract(x: CGFloat, y: CGFloat) -> CGFloat {
        return x - y
    }
    func add(x: CGFloat, y: CGFloat) -> CGFloat {
        return x + y
    }
}
