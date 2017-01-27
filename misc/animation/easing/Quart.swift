import Foundation
//Quartic
class Quart {
    static func easeInQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t/d
        return c*t*t*t*t + b
    }
    static func easeOutQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = (t/d)-1//<--the brackets are important
        return -c * (t*t*t*t - 1) + b
    }
    static func easeInOutQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        var t = t
        t = t/(d/2)//<--the brackets are important
        if (t < 1) {return c/2*t*t*t*t + b}
        t = t-2
        return -c/2 * (t*t*t*t - 2) + b
    }
}
