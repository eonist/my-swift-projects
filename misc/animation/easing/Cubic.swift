import Foundation

class Cubic {
    private static func easeInCubic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d
        return c * pow(t, 3) + b
    }
    private static func easeOutCubic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d - 1
        return c * (pow(t, 3) + 1) + b
    }
    private static func easeInOutCubic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * t * t * t + b
        } else {
            t = t - 2
            return c / 2 * ( t * t * t + 2 ) + b
        }
    }
}
