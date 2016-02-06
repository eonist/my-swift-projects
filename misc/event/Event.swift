import Cocoa

class Event{
    var type:String/**/
    var origin:NSView//origin sender of event, this could also be weak if you discover a memory leak
    /*var immidiate:Any?*///prev sender of event
    init(_ type:String = "", _ origin:NSView/*, immidiate:Any? = nil*/){
        self.type = type/**/
        self.origin = origin
    }
}

