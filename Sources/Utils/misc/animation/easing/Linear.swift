import Foundation
/**
 * No easing, linear animation
 */
class Linear{
    static func ease(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b
    }
}
