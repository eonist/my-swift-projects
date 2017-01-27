import Foundation

class Quad {
    //Quadratic
    static func easeInQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t/d
        return c*t*t + b
    }
    static func easeOutQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t/d
        return -c*t*(t-2) + b
    }
    static func easeInOutQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * t * t + b
        }
        return -c / 2 * ((t - 1) * (t - 3) - 1) + b
    }
    static func easeOutInQuad ( _ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
        if t < d / 2 {
            return easeOutQuad(t * 2,  b, c / 2,  d)
        }
        return easeInQuad((t * 2) - d,  b + c / 2,  c / 2,  d)
    }

}
