import Foundation

class Linear{
    //No easing, linear animation
    static func easeLinear(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b
    }
}
