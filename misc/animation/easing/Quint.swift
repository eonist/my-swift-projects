import Foundation

class Quint{
    //Quintic - QUINTIC EASING: t^5
    static func easeInQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t/d
        return c * pow(t, 5) + b
    }
    static func easeOutQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d - 1
        return c * (pow(t, 5) + 1) + b
    }
    static func easeInOutQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat {
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * pow(t, 5) + b
        } else {
            t = t - 2
            return c / 2 * (pow(t, 5) + 2) + b
        }
    }
    static func easeOutInQuint (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat {
        if t < d / 2 {
            return easeOutQuint(t * 2,  b,  c / 2,  d)
        } else {
            return easeInQuint((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}
