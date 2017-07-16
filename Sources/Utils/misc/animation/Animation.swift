import Cocoa
/**
 * NOTE: This view class serves as a basis for frame animation. 
 * NOTE: Override the onFrame method to do frame animations
 * NOTE: Start and stop with CVDisplayLinkStart(displayLink) and CVDisplayLinkStop(displayLink) and CVDisplayLinkIsRunning(displayLink) to assert if the displayLink is running
 * TODO: ⚠️️ You can probably use NSObject instead of NSView. As NSObject has the performSelector method
 * TODO: ⚠️️ Package these classes as its own lib. Kinetic. Bump. mc2. Other names? 🚫 👉 I think Animation is an appropriate name 👈
 */
class Animation:NSView,IAnimatable{/*apparently the class needs to be NSView in order for the performSelector to work*///<---TODO: you can delete the IAnimatable
    static let sharedInstance = Animation()//TODO: rename to .shared
    lazy var displayLink:CVDisplayLink = self.setUpDisplayLink()/*This is the instance that enables frame animation, lazying this value will probably haunt me later, playing with fire*/
    var animators:[BaseAnimation] = []
    /**
     * Fires on every screen refresh at 60 FPS, or device speed
     */
    func onFrame(){
        self.performSelector(onMainThread: #selector(Animation.onFrameOnMainThread), with: nil, waitUntilDone: false)//upgreaded to swift 3
    }
    /**
     *
     */
    func onFrameOnMainThread(){
        for animator in animators{animator.onFrame()}
    }
    /**
     * NOTE: It seems that you can't move this method into a static class method. Either internally in the same file or externally in another file
     * NOTE: This method fires 60FPS
     */
    func setUpDisplayLink() -> CVDisplayLink {
        var displayLink:CVDisplayLink?
        var status = kCVReturnSuccess
        status = CVDisplayLinkCreateWithActiveCGDisplays(&displayLink)
        //Swift.print("status: " + "\(status)")
        /* Set up DisplayLink. */
        func displayLinkOutputCallback( displayLink: CVDisplayLink,_ inNow: UnsafePointer<CVTimeStamp>, _ inOutputTime: UnsafePointer<CVTimeStamp>,_ flagsIn: CVOptionFlags, _ flagsOut: UnsafeMutablePointer<CVOptionFlags>,_ displayLinkContext: UnsafeMutableRawPointer?) -> CVReturn{
            unsafeBitCast(displayLinkContext, to: Animation.self).onFrame()
            return kCVReturnSuccess
        }
        let outputStatus = CVDisplayLinkSetOutputCallback(displayLink!, displayLinkOutputCallback, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
        _ = outputStatus
        let displayID = CGMainDisplayID()
        let displayIDStatus = CVDisplayLinkSetCurrentCGDisplay(displayLink!, displayID)
        _ = displayIDStatus
        return displayLink!
    }
}
