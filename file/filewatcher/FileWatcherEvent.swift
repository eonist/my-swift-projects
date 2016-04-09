import Foundation

class FileWatcherEvent:Event{
    override init(_ type:String = "", _ origin:AnyObject){
        super.init(type,origin)
    }
}
