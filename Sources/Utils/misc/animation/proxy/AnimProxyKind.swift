import Cocoa
/**
 * TODO: ⚠️️ This should possibly be renamed to IAnimatableView
 * TODO: ⚠️️ This protocol may not even be needed as you dont extend AnimProxy
 */
typealias IAnimatable = AnimProxyKind/*legacy support*/
typealias Animatable = AnimProxyKind
protocol AnimProxyKind:class {
    func onFrame()
    var animators:[FrameAnimatable]{get set}
    var displayLink:CVDisplayLink{get}
}
