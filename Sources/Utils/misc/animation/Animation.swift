import Cocoa
/**
 * NOTE: This view class serves as a basis for frame animation. 
 * NOTE: override the onFrame method to do frame animations
 * NOTE: Start and stop with CVDisplayLinkStart(displayLink) and CVDisplayLinkStop(displayLink) and CVDisplayLinkIsRunning(displayLink) to assert if the displayLink is running
 * TODO: you can probably use NSObject instead of NSView. As NSObject has the performSelector method
 * TODO: package these classes as its own lib. Kinetic. Bump. mc2. Other names?
 */
class Animation:NSView,IAnimatable{/*apparently the class needs to be NSView in order for the performSelector to work*///<---TODO: you can delete the IAnimatable
    static let sharedInstance = Animation()
    lazy var displayLink:CVDisplayLink = self.setUpDisplayLink()/*This is the instance that enables frame animation, lazying this value will probably haunt me later, playing with fire*/
    var animators:Array<BaseAnimation> = []
    //var drawCalls:Array<()->Void> = []
    /**
     * Fires on every screen refresh at 60 FPS, or device speed
     */
    func onFrame(){
        //Swift.print("\(self.dynamicType)" + "onFrame()")
        self.performSelector(onMainThread: #selector(Animation.onFrameOnMainThread), with: nil, waitUntilDone: false)//upgreaded to swift 3
    }
    /**
     *
     */
    func onFrameOnMainThread(){
        //Swift.print("it works")
        for animator in animators{animator.onFrame()}
        /*while drawCalls.count > 0{
        if(drawCalls.count > 0){drawCalls.removeFirst()()}//the extra assert was needed strangly enough, or els bugs started to appear after some time with stress testing
        }*/
        //CATransaction.flush()/*if you dont flush your animation wont animate and you get this message: CoreAnimation: warning, deleted thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in environment to log backtraces.*/
    }
    /**
     * Note: It seems that you can't move this method into a static class method. Either internally in the same file or externally in another file
     */
    func setUpDisplayLink() -> CVDisplayLink {
        Swift.print("Animation.setUpDisplayLink()")
        var displayLink: CVDisplayLink?
        var status = kCVReturnSuccess
        status = CVDisplayLinkCreateWithActiveCGDisplays(&displayLink)
        //Swift.print("status: " + "\(status)")
        /* Set up DisplayLink. This method fires 60fps*/
        func displayLinkOutputCallback( displayLink: CVDisplayLink,_ inNow: UnsafePointer<CVTimeStamp>, _ inOutputTime: UnsafePointer<CVTimeStamp>,_ flagsIn: CVOptionFlags, _ flagsOut: UnsafeMutablePointer<CVOptionFlags>,_ displayLinkContext: UnsafeMutableRawPointer?) -> CVReturn{
            //Swift.print("displayLink is setup")
            unsafeBitCast(displayLinkContext, to: Animation.self).onFrame()//drawRect(unsafeBitCast(displayLinkContext, NSOpenGLView.self).frame)
            return kCVReturnSuccess
        }
        
        //(displayLink!, displayLinkOutputCallback, UnsafeMutableRawPointer(unsafeAddressOf(self)))//
        let outputStatus = CVDisplayLinkSetOutputCallback(displayLink!, displayLinkOutputCallback, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
        _ = outputStatus
        //Swift.print("outputStatus: " + "\(outputStatus)")
        let displayID = CGMainDisplayID()
        let displayIDStatus = CVDisplayLinkSetCurrentCGDisplay(displayLink!, displayID)
        _ = displayIDStatus
        //Swift.print("displayIDStatus: " + "\(displayIDStatus)")
        return displayLink!
    }
}
