import Foundation

struct AnimationState4<T> {
    let value: T
    let targetValue: T
    let velocity: T
    let stopVelocity: T
}
//(value:T,targetValue:T,velocity:T,stopVelocity:T)

//var initPointValues: Easer4<CGPoint>.InitValues = (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))//
