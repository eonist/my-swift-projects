import Cocoa
/**
 * You can only setup 1 CVDisplayLink as such you can only have 1 AnimProxy class to controll it
 * NOTE: This view class serves as a basis for frame animation.
 * NOTE: Override the onFrame method to do frame animations
 * NOTE: Start and stop with CVDisplayLinkStart(displayLink) and CVDisplayLinkStop(displayLink) and CVDisplayLinkIsRunning(displayLink) to assert if the displayLink is running
 * TODO: ⚠️️ You can probably use NSObject instead of NSView. As NSObject has the performSelector method
 * TODO: ⚠️️ Package these classes as it's own lib. Kinetic. Bump. mc2. Other names? 🚫 👉 I think Animation is an appropriate name 👈 maybe AnimManager? or 👉 AnimProxy? 👈 👌
 */
class AnimProxy:NSView,AnimProxyKind{/*apparently the class needs to be NSView in order for the performSelector to work*///<---TODO: you can delete the IAnimatable
    static let sharedInstance = AnimProxy()//TODO: ⚠️️ rename to .shared
    lazy var displayLink:CVDisplayLink = self.setUpDisplayLink()/*This is the instance that enables frame animation, lazying this value will probably haunt me later, playing with fire*/
    var animators:[FrameAnimator] = []/*Stores the animators*/
    /**
     * Fires on every screen refresh at 60 FPS, or device speed
     */
    func onFrame(){
        self.performSelector(onMainThread: #selector(/*TODO:⚠️️ the Animation. can probably be omitted->*/AnimProxy.onFrameOnMainThread), with:nil, waitUntilDone:false)//upgreaded to swift 3
    }
    /**
     * Tick every animator on every frame tick (This is called on the MainThread)
     */
    func onFrameOnMainThread(){
        animators.forEach{$0.onFrame()}
    }
    /**
     * NOTE: It seems that you can't move this method into a static class method. Either internally in the same file or externally in another file
     * NOTE: This method fires 60FPS
     */
    func setUpDisplayLink() -> CVDisplayLink {
        var displayLink:CVDisplayLink?
        var status = kCVReturnSuccess
        status = CVDisplayLinkCreateWithActiveCGDisplays(&displayLink)
        /* Set up DisplayLink. */
        func displayLinkOutputCallback(displayLink:CVDisplayLink,_ inNow: UnsafePointer<CVTimeStamp>, _ inOutputTime: UnsafePointer<CVTimeStamp>,_ flagsIn: CVOptionFlags, _ flagsOut: UnsafeMutablePointer<CVOptionFlags>,_ displayLinkContext: UnsafeMutableRawPointer?) -> CVReturn{
            unsafeBitCast(displayLinkContext, to:AnimProxy.self).onFrame()
            return kCVReturnSuccess
        }
        if let displayLink = displayLink {
            /*let outputStatus */  _ = CVDisplayLinkSetOutputCallback(displayLink, displayLinkOutputCallback, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
            let displayID = CGMainDisplayID()
            /*let displayIDStatus*/_ = CVDisplayLinkSetCurrentCGDisplay(displayLink, displayID)
            return displayLink
        }else{
            fatalError("unable to setup displayLink")
        }
    }
}
