import Cocoa
/**
 * TODO: ⚠️️ This should possibly be renamed to IAnimatableView
 * TODO: ⚠️️ This protocol may not even be needed as you dont extend AnimProxy
 */
protocol AnimProxyKind2:class {
    func onFrame()
    var animators:[FrameAnimator2]{get set}
    var displayLink:CVDisplayLink{get}
}
