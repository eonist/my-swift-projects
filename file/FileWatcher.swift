import Foundation
/**
 * Watches for file changes in a list of filePaths
 * NOTE: You could stop and start to restart
 */
public class FileWatcher {
    let filePaths: [String]
    var hasStarted = false
    var streamRef:FSEventStreamRef?
    public private(set) var lastEventId: FSEventStreamEventId/*<- this needs to be public private or an error will happen when in use*/
    public init(_ paths: [String], _ sinceWhen: FSEventStreamEventId) {
        self.lastEventId = sinceWhen
        self.filePaths = paths
    }
    /**
     *
     */
    private let eventCallback: FSEventStreamCallback = { (stream: ConstFSEventStreamRef, contextInfo: UnsafeMutablePointer<Void>, numEvents: Int, eventPaths: UnsafeMutablePointer<Void>, eventFlags: UnsafePointer<FSEventStreamEventFlags>, eventIds: UnsafePointer<FSEventStreamEventId>) in
        Swift.print("eventCallback()")
        let fileSystemWatcher: FileWatcher = unsafeBitCast(contextInfo, FileWatcher.self)
        let paths = unsafeBitCast(eventPaths, NSArray.self) as! [String]
        var eventFlagArray = Array(UnsafeBufferPointer(start: eventFlags, count: numEvents))
        for index in 0..<numEvents {
            fileSystemWatcher.handleEvent(eventIds[index], paths[index], eventFlagArray[index])
        }
        fileSystemWatcher.lastEventId = eventIds[numEvents - 1]
    }
    /**
     * NOTE: The switch differentiates between eventFlags (aka file event types)
     * PARAM: eventFlags: pertains to the file event type. From Apples Docs: An array of flag words corresponding to the paths in the eventPaths parameter. If no flags are set, then there was some change in the directory at the specific path supplied in this event. See FSEventStreamEventFlags.
     * PARAM: eventId: is an id number that the os uses to differentiate between events. 
     * PARAM:
     */
    private func handleEvent(eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags) {
        Swift.print("\t eventId: \(eventId) - eventFlags:  \(eventFlags) - eventPath:  \(eventPath)")

        switch eventFlags{
        case Flags.dataChange:
            Swift.print("data change")
        case Flags.change:
            Swift.print("file change")
        case Flags.delete:
            Swift.print("delete")
        case Flags.added:
            Swift.print("added")
        default:
            Swift.print("unsupported event: " + "\(eventFlags)")
            break;
            
            
        }
        //let created:UInt32  = FSEventStreamEventFlags(kFSEventStreamEventFlagItemCreated)
        let removed:UInt32  = FSEventStreamEventFlags(kFSEventStreamEventFlagItemRemoved)
        if(eventFlags == removed){
            Swift.print("works")
        }
        //uint32 removed = kFSEventStreamEventFlagItemRemoved;
        
        let ItemModified = FSEventStreamEventFlags(kFSEventStreamEventFlagItemModified)
        
        if(eventFlags == UInt32(ItemModified.value)){Swift.print("bingo")}
        /*
        let flags:FSEventStreamEventFlags  = eventFlags[0]
        if (flags & kFSEventStreamEventFlagItemCreated) {
            NSLog(@"File Created!");
        } else if (flags & kFSEventStreamEventFlagItemRenamed) {
            NSLog(@"File Renamed!");
        } else if (flags & kFSEventStreamEventFlagItemRemoved) {
            NSLog(@"File Removed!");
        }
        */
    }
    /**
     * Start listening for FSEvents
     * NOTE: Starts receiving events and servicing them from the client's runloop(s) using the callback supplied by the client when the stream was created. If a value was supplied for the sinceWhen parameter then "historical" events will be sent via your callback first, then a HistoryDone event, then "contemporary" events will be sent on an ongoing basis (as though you had supplied kFSEventStreamEventIdSinceNow for sinceWhen).
     */
    public func start() {
        Swift.print("start - has started: " + "\(hasStarted)")
        if(hasStarted){return}/*<--only start if its not already started*/
        var context = FSEventStreamContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        context.info = UnsafeMutablePointer<Void>(unsafeAddressOf(self))
        let flags = UInt32(kFSEventStreamCreateFlagUseCFTypes | kFSEventStreamCreateFlagFileEvents)
        streamRef = FSEventStreamCreate(kCFAllocatorDefault, eventCallback, &context, filePaths, lastEventId, 0, flags)//Creates an FSEventStream.
        FSEventStreamScheduleWithRunLoop(streamRef!, CFRunLoopGetMain(), kCFRunLoopDefaultMode)// Schedules an FSEventStream on a runloop, like CFRunLoopAddSource() does for a CFRunLoopSourceRef.
        FSEventStreamStart(streamRef!)
        hasStarted = true
    }
    /**
     * Stop listening for FSEvents
     * NOTE: Stops the stream, ensuring the client's callback will not be called again for this stream. After stopping the stream, it can be restarted seamlessly via FSEventStreamStart() without missing any events.
     */
    public func stop() {
        Swift.print("stop - has started: " + "\(hasStarted)")
        if(!hasStarted){return}/*<--only stop if it has been started*/
        FSEventStreamStop(streamRef!)
        FSEventStreamInvalidate(streamRef!)//Invalidates the stream, like CFRunLoopSourceInvalidate() does for a CFRunLoopSourcRef.
        FSEventStreamRelease(streamRef!)//Decrements the refcount on the stream (initially one and incremented via FSEventStreamRetain()). If the refcount reaches zero, the stream is deallocated.
        streamRef = nil
        hasStarted = false
    }
    /**
     * Carefull with enabling this as we dont deinit things in swift
     * NOTE: if you enable it the class will deint right after its init.
     */
    deinit {
        //stop()
    }
}
extension FileWatcher{
    /**
     * Convenince init
     */
    convenience public init(_ pathsToWatch: [String]) {
        self.init(pathsToWatch, FSEventStreamEventId(kFSEventStreamEventIdSinceNow))
    }
}
/**
 * Helper class to differentiate between the FSEvent flag types (aka file event types)
 * When the .DS_STORE updates: it seems to throw the flag: 70656
 */
private class Flags{
    static var dataChange:UInt32 = 128000//data in the file changed
    static var change:UInt32 = 67584//add,rename, move? (2 events for rename one before and after)
    static var delete:UInt32 = 111872//the file was deleted
    static var added:UInt32 = 107776//the file was added
    
}