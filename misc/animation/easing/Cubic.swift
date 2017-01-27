import Foundation
/**
 * Cubic
 */
class Cubic {
    static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d
        return c * pow(t, 3) + b
    }
    static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d - 1
        return c * (pow(t, 3) + 1) + b
    }
    static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * t * t * t + b
        } else {
            t = t - 2
            return c / 2 * ( t * t * t + 2 ) + b
        }
    }
    static func easeOutIn (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if t < d / 2 {
            return easeOut(t * 2,  b,  c / 2,  d)
        } else {
            return easeIn((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}
