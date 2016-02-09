import Cocoa

class Event{
    static var change:String = "eventChange"
    var type:String/**/
    var origin:AnyObject//origin sender of event, this could also be weak if you discover a memory leak
    /*var immidiate:Any?*///prev sender of event
    init(_ type:String = "", _ origin:AnyObject/*, immidiate:Any? = nil*/){
        self.type = type/**/
        self.origin = origin
    }
}

