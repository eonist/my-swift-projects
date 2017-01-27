import Foundation
//Exponential
class Expo{
    static func easeInExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b
    }
    static func easeOutExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b
    }
    static func easeInOutExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        if (t == 0) {return b}
        if (t == d) {return b+c}
        t = t / d * 2
        if (t < 1){ return c/2 * pow(2, 10 * (t - 1)) + b}
        t = t - 1
        return c/2 * (-pow(2, -10 * t) + 2) + b
    }
    static func easeOutInExpo (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        if t < d / 2 {
            return easeOutExpo(t * 2, b,  c / 2,  d)
        } else {
            return easeInExpo((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}

