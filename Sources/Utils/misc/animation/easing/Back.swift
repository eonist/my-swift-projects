import Foundation
/**
 * Back
 */
class Back {
    static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var s:CGFloat? = nil
        if s == nil { s = 1.70158 }
        var t = t
        t = t / d
        return c * t * t * ((s! + 1 ) * t - s!) + b
    }
    static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var s:CGFloat? = nil
        if s == nil { s = 1.70158 }
        var t = t
        t = t / d - 1
        return c * (t * t * ((s! + 1) * t + s!) + 1) + b
    }
    static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var s:CGFloat? = nil
        if s == nil { s = 1.70158 }
        s = s! * 1.525
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * (t * t * ((s! + 1) * t - s!)) + b
        } else {
            t = t - 2
            return c / 2 * (t * t * ((s! + 1) * t + s!) + 2) + b
        }
    }
}
