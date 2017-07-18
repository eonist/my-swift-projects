import Cocoa
/**
 * TODO: ⚠️️ This should possibly be renamed to IAnimatableView
 */
typealias IAnimatable = Animatable/*legacy support*/
protocol Animatable:class {
    func onFrame()
    var animators:[BaseAnimatable]{get set}
    var displayLink:CVDisplayLink{get}
}
