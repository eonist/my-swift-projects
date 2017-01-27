import Foundation

class Circ {
    /*Circular*/
    static func easeInCircular(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d
        return (-c * (sqrt( 1 - pow(t, 2)) - 1) + b)
    }
    static func easeOutCircular(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d - 1
        return (c * sqrt(1 - pow(t, 2)) + b)
    }
    static func easeInOutCircular(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        
         if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
         return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
        
    }
}
