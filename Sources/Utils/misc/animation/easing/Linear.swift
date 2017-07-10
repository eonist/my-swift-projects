import Foundation
/**
 * No easing, linear animation
 * TODO: ⚠️️ An idea is to use enums to attach equations to the animator like Easing.linear.ease etc
 */
class Linear{
    static func ease(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b
    }
}
