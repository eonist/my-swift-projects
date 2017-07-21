import Cocoa
/**
 * PARAM: t: time (current frame) this can also be actual time
 * PARAM: b: begin (the value it is at the begining)
 * PARAM: c: change (end value - begining value) sort of the amount to change, this can also be described as the difference between two values
 * PARAM: d: duration (total frames in anim) this can also be actual time
 * TODO: ⚠️️ Complete the: Elastic, Circular, Back, bounce, Quibic +++
 * NOTE: robertpenner.com has lots of tutorials and pdfs on how easing works
 */
typealias EasingEquation = (_ t:CGFloat,_ b:CGFloat,_ c:CGFloat,_ d:CGFloat)->CGFloat/*Easing equation signature*/
class Easing{
    static var back:Back.Type {return Back.self}
    static var bounce:Bounce.Type {return Bounce.self}
    static var circ:Circ.Type {return Circ.self}
    static var cubic:Cubic.Type {return Cubic.self}
    static var elastic:Elastic.Type {return Elastic.self}
    static var expo:Expo.Type {return Expo.self}
    static var linear:Linear.Type {return Linear.self}
    static var quad:Quad.Type {return Quad.self}
    static var quart:Quart.Type {return Quart.self}
    static var quint:Quint.Type {return Quint.self}
    static var sine:Sine.Type {return Sine.self}
}
/**
 * NOTE: If you decrease the decimal variable you increase the friction effect
 */
/*
static func easeOut(value : CGFloat, _ from:CGFloat, _ to:CGFloat) -> CGFloat {
    let distToGoal:CGFloat = NumberParser.relativeDifference(value, to)
    let val:CGFloat = 0.2 * distToGoal
    return val
}
*/
