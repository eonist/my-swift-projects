import Foundation

class Easer4<T: Advancable4> FrameAnimator, PhysicsAnimKind4{
    
    var easing:T
    var initValues:PhysicsAnimKind4.InitValues
    var callBack:FrameTickSignature
}
