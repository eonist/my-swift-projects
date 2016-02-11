import Foundation
/*
 * TODO: Implement the immediate variable if its needed (it would be a way to get assert the 1-level down immediate child an event came from, rather than the origin child which can be many levels deeper in the hirarchy)
 */
class Event{
    static var update:String = "eventUpdate"/*Idealy I would name this change but aparantly then subclasses can name their const the same*/
    var type:String/**/
    var origin:AnyObject/*origin sender of event, this could also be weak if you discover a memory leak*/
    /*var immidiate:Any?*///prev sender of event
    init(_ type:String = "", _ origin:AnyObject/*, immidiate:Any? = nil*/){
        self.type = type/**/
        self.origin = origin
    }
}