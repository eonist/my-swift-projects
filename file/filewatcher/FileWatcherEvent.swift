import Foundation

class FileWatcherEvent:Event{
    static var change:String = "fileWatcherEventChange"
    var eventId: FSEventStreamEventId
    var eventPath:String
    var eventFlags: FSEventStreamEventFlags
    init(_ type:String = "", _ origin:AnyObject, _ eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags){
        self.eventId = eventId
        self.eventPath = eventPath
        self.eventFlags = eventFlags
        super.init(type,origin)
    }
}
extension FileWatcherEvent{
    var fileChange:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemIsFile)) != 0}
    var fileCreated:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemCreated)) != 0}
    var fileRemoved:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRemoved)) != 0}
    var fileRenamed:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRenamed)) != 0}
    var fileModified:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemModified)) != 0}
}
/*

if (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemCreated)) != 0 {/*file created*/
    Swift.print("file created")
}
if (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRemoved)) != 0 {/*file removed*/
    Swift.print("File removed: \(eventPath) - \(eventId)")
}
if (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRenamed)) != 0 {/*file renamed*/
    Swift.print("file renamed")
}
if (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemModified)) != 0 {/*file modified*/
    Swift.print("File modified: \(eventPath) - \(eventId)")
}

*/