import Foundation

public class FileWatcher {
    let paths: [String]
    var hasStarted = false
    var streamRef:FSEventStreamRef?
    var lastEventId:FSEventStreamEventId
    init(_ paths: [String], _ sinceWhen: FSEventStreamEventId) {
        self.lastEventId = sinceWhen
        self.paths = paths
    }
    /**
     *
     */
    let eventCallback: FSEventStreamCallback = { (stream: ConstFSEventStreamRef, contextInfo: UnsafeMutablePointer<Void>, numEvents: Int, eventPaths: UnsafeMutablePointer<Void>, eventFlags: UnsafePointer<FSEventStreamEventFlags>, eventIds: UnsafePointer<FSEventStreamEventId>) in
        Swift.print("eventCallback()")
        let fileWatcher:FileWatcher = unsafeBitCast(contextInfo, FileWatcher.self)
        let paths = unsafeBitCast(eventPaths, NSArray.self) as! [String]
        for index in 0..<numEvents {
            fileWatcher.handleEvent(eventIds[index], paths[index], eventFlags[index])
        }
        fileWatcher.lastEventId = eventIds[numEvents - 1]
    }
    /**
     * NOTE: I think you need to create a switch to differentiate between eventFlags
     */
    func handleEvent(eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags) {
        Swift.print("\t eventId: \(eventId) - eventFlags:  \(eventFlags) - eventPath:  \(eventPath)")
        switch eventFlags{
        case 128000:
            Swift.print("modified")
        case 67584:
            Swift.print("rename,add,remove")
        case 111872:
            Swift.print("delete")
        default:
            Swift.print("unsupported event: " + "\(eventFlags)")
            break;
        }
    }
    /**
     * Start listening for FSEvents
     */
    func start() {
        Swift.print("start - has started: " + "\(hasStarted)")
        if(hasStarted){return}/*<--only start if its not already started*/
        var context = FSEventStreamContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        context.info = UnsafeMutablePointer<Void>(unsafeAddressOf(self))
        let flags = UInt32(kFSEventStreamCreateFlagUseCFTypes | kFSEventStreamCreateFlagFileEvents)
        streamRef = FSEventStreamCreate(kCFAllocatorDefault, eventCallback, &context, paths, lastEventId, 0, flags)
        FSEventStreamScheduleWithRunLoop(streamRef!, CFRunLoopGetMain(), kCFRunLoopDefaultMode)
        FSEventStreamStart(streamRef!)
        hasStarted = true
    }
    /**
     * Stop listening for FSEvents
     */
    func stop() {
        Swift.print("stop - has started: " + "\(hasStarted)")
        if(!hasStarted){return}/*<--only stop if it has been started*/
        FSEventStreamStop(streamRef!)
        FSEventStreamInvalidate(streamRef!)
        FSEventStreamRelease(streamRef!)
        streamRef = nil
        hasStarted = false
    }
    deinit {
        //stop()
    }
}
extension FileWatcher{
    convenience init(_ pathsToWatch: [String]) {
        self.init(pathsToWatch, FSEventStreamEventId(kFSEventStreamEventIdSinceNow))
    }
}
