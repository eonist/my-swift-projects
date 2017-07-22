import Foundation

protocol FrameAnimatable {
    var animProxy:AnimProxyKind {get set}
    func onFrame()
    func start()
    func stop()
}

extension FrameAnimatable {
    /**
     * Assert if an animator is active or not, you can also check if the Animator is nil to check if is active or not
     * TODO: ⚠️️ Name this hasStopped or isActive
     */
    var stopped:Bool {return animProxy.animators.indexOf(self) == -1}
}
