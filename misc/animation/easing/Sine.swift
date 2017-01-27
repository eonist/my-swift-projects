import Foundation
/**
 * Sine SINUSOIDAL EASING: sin(t)
 */
class Sine{
    static func easeInSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c * cos(t/d * π2) + c + b
    }
    static func easeOutSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c * sin(t/d * π2) + b
    }
    static func easeInOutSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c/2 * (cos(π*t/d) - 1) + b
    }
    static func easeOutInSine (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if t < d / 2 {
            return easeOutSine(t * 2,  b,  c / 2,  d)
        } else {
            return easeInSine((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}
