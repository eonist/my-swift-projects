import Cocoa
/**
 * TODO: ⚠️️ This should possibly be renamed to IAnimatableView
 */
typealias IAnimatable = Animatable/*legacy support*/
protocol Animatable:class {
    func onFrame()
    var animators:[BaseAnimation]{get set}
    var displayLink:CVDisplayLink{get}
}
