import Foundation
/**
 * Bounce
 */
class Bounce{
    static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        return c - easeOut(d - t, 0, c, d) + b
    }
    static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        var t = t
        t = t / d
        if t < 1 / 2.75 {
            return c * (7.5625 * t * t) + b
        } else if t < 2 / 2.75 {
            t = t - (1.5 / 2.75)
            return c * (7.5625 * t * t + 0.75) + b
        } else if t < 2.5 / 2.75 {
            t = t - (2.25 / 2.75 )
            return c * (7.5625 * t * t + 0.9375) + b
        } else {
            t = t - (2.625 / 2.75 )
            return c * (7.5625 * t * t + 0.984375) + b
        }
    }
    static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        if t < d / 2 {
            return easeIn(t * 2, 0, c, d) * 0.5 + b
        } else {
            return easeOut(t * 2 - d, 0, c, d) * 0.5 + c * 0.5 + b
        }
    }
    static func easeOutIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        if t < d / 2 {
            return easeOut(t * 2, b, c / 2, d)
        } else {
            return easeIn((t * 2) - d, b + c / 2, c / 2, d)
        }
    }
}

