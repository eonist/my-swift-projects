import Foundation
/**
 * Elastic
 */
class Elastic {
    private static func easeInElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        var a: CGFloat? = nil
        var p: CGFloat? = nil
        if t == 0 { return b }
        t = t / d
        if t == 1 { return b + c }
        if p == nil { p = d * 0.3 }
        var s: CGFloat
        if a == nil || a! < abs( c ) {
            a = c
            s = p! / 4
        } else {
            s = p! / (2 * CGFloat(M_PI)) * asin(c / a!)
        }
        t = t - 1
        return -(a! * pow(2, 10 * t) * sin((t * d - s) * (2 * CGFloat(M_PI)) / p!)) + b
    }
    static func easeOutElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        var a: CGFloat? = nil
        var p: CGFloat? = nil
        if t == 0 { return b }
        t = t / d
        if t == 1 { return b + c }
        if p == nil { p = d * 0.3 }
        var s: CGFloat
        if a == nil || a! < abs(c) {
            a = c
            s = p! / 4
        } else {
            s = p! / (2 * CGFloat(M_PI)) * asin(c/a!)
        }
        return a! * pow(2, -10 * t) * sin((t * d - s) * (2 * CGFloat(M_PI)) / p!) + c + b
    }
    static func easeInOutElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        var a: CGFloat? = nil
        var p: CGFloat? = nil
        if t == 0 { return b }
        t = t / d * 2
        if t == 2 { return b + c }
        if p == nil { p = d * (0.3 * 1.5) }
        if a == nil { a = 0 }
        
        var s: CGFloat
        if a == nil || a! < abs(c) {
            a = c
            s = p! / 4
        } else {
            s = p! / (2 * CGFloat(M_PI)) * asin(c/a!)
        }
        
        if t < 1 {
            t = t - 1
            return -0.5 * (a! * pow(2, 10 * t) * sin((t * d - s) * (2 * CGFloat( M_PI )) / p!)) + b
        } else {
            t = t - 1
            return a! * pow(2, -10 * t) * sin((t * d - s) * (2 * CGFloat( M_PI )) / p! ) * 0.5 + c + b
        }
    }
}
