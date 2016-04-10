import Foundation

class FileWatcherEvent{
    var eventId: FSEventStreamEventId
    var eventPath:String
    var eventFlags: FSEventStreamEventFlags
    init(_ eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags){
        self.eventId = eventId
        self.eventPath = eventPath
        self.eventFlags = eventFlags
    }
}
/**
 * The following code is to differentiate between the FSEvent flag types (aka file event types)
 * NOTE: Be aware that .DS_STORE changes frequently when other files change
 */
extension FileWatcherEvent{
    /*general*/
    var fileChange:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemIsFile)) != 0}
    var dirChange:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemIsDir)) != 0}
    /*crud*/
    var created:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemCreated)) != 0}
    var removed:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRemoved)) != 0}
    var renamed:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemRenamed)) != 0}
    var modified:Bool {return (eventFlags & FSEventStreamEventFlags(kFSEventStreamEventFlagItemModified)) != 0}
}
/**
 * Convenince
 */
extension FileWatcherEvent{
    /*File*/
    var fileCreated:Bool {return fileChange && created}
    var fileRemoved:Bool {return fileChange && removed}
    var fileRenamed:Bool {return fileChange && renamed}
    var fileModified:Bool {return fileChange && modified}
    /*Directory*/
    var dirCreated:Bool {return dirChange && created}
    var dirRemoved:Bool {return dirChange && removed}
    var dirRenamed:Bool {return dirChange && renamed}
    var dirModified:Bool {return dirChange && modified}
}
extension FileWatcherEvent{
    var description: String {
        var result = "< \(self.eventPath)"
        if self.created {
            result += " created"
        }
        if self.removed {
            result += " removed"
        }
        if self.renamed {
            result += " renamed"
        }
        if self.modified {
            result += " modified"
        }
        result = result + ">"
        return result
    }
}
