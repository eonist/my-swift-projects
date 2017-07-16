import Cocoa
/**
 * TODO: ⚠️️ This should possibly be renamed to IAnimatableView
 */
protocol IAnimatable:class {
    func onFrame()
    var animators:[BaseAnimation]{get set}
    var displayLink:CVDisplayLink{get}
}
