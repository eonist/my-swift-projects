import Foundation

class Back {
    //Back
    static func easeInBack(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c*(t/=d)*t*((s+1)*t - s) + b
    }
    static func easeOutBack(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
    }
    static func easeInOutBack(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b
         return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b
    }
}
