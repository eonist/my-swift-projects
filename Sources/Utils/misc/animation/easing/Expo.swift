import Foundation
/**
 * Exponential
 */
class Expo{
    static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b
    }
    static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b
    }
    static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        if (t == 0) {return b}
        if (t == d) {return b+c}
        t = t / d * 2
        if (t < 1){ return c/2 * pow(2, 10 * (t - 1)) + b}
        t = t - 1
        return c/2 * (-pow(2, -10 * t) + 2) + b
    }
    static func easeOutIn (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        if t < d / 2 {
            return easeOut(t * 2, b,  c / 2,  d)
        } else {
            return easeIn((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}

