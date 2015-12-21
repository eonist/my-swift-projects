import Foundation
/**
 * TODO: create two Gradient classes the extends a common Gradient class. LinearGradient and RadialGradient, ILinearGradient, IRadialGradient etc
 * NOTE: the radial scalar values can also be more or less than 0 and 1. think width * 1.2 etc. Works for both pos and size. (the only thing that is capped is the size if it goes under 0, then it is capped to 0)
 * NOTE: Why are we using realtive values for the radial gradient when xcode supports absolute points? Because absolute values cant be applied to different graphics. Absolute values only work with one exact graphic.
 */
class RadialGradient {
    var relativeStartCenter:CGPoint?//0 to 1 (x:0.5 means half way accross the boundingbox etc) (from the intersection of the normal and an edge in the boundingbox)
    var relativeEndCenter:CGPoint?//0 to 1 (same as relativeEndCenter)
    var relativeStartRadius:CGSize?//0 to 1 (x:0.5 means half the size of the current cross-section in the x-axis) the x-axis is determined by the rotation
    var relativeEndRadius:CGSize?//0 to 1 (same as relativeStartRadius)
}
