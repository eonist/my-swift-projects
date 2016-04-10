import Foundation

class FileWatcherEvent:Event{
    static var change:String = "fileWatcherEventChange"
    init(_ type:String = "", _ origin:AnyObject, _ eventId: FSEventStreamEventId, _ eventPath: String, _ eventFlags: FSEventStreamEventFlags){
        super.init(type,origin)
    }
}
extension FileWatcherEvent{
    
}