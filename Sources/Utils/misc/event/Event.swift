import Foundation
/*
 * TODO: ⚠️️ Implement the immediate variable if its needed (it would be a way to get assert the 1-level down immediate child an event came from, rather than the origin child which can be many levels deeper in the hierarchy)
 * NOTE: Event could be a struct, most Event classes are really simple and their passed data could be accessed via origin, maybe try using a struct for Element iOS, Use decoration to subclass struct
 * TODO: ⚠️️ Event should extend string or stringconvertible etc. So that one can do onEvent(.update) the subclasses can do .mouseDown etc
 * FUTURE: ⚠️️ The idea with events and enum is that you make Event generic so it can take many types of enums
 * TODO: ⚠️️ Origin should be optional
 * TODO: ⚠️️ Event could definitly be a Struct, just use the decorator pattern for other event types
 */
class Event{
    static var update:String = EventType.update.rawValue//EventType.update.rawValue/*Ideally I would name this change but apparently then subclasses can name their const the same*/
    var type:String
    var origin:AnyObject/*origin sender of event, this could also be weak if you discover a memory leak*///TODO:this should be of type IEventSender
    var immediate:AnyObject/*previouse sender of event, TODO: ⚠️️ this should be of type IEventSender*/
    init(_ type:String = "", _ origin:AnyObject){
        self.type = type
        self.origin = origin
        self.immediate = origin
    }
}
enum EventType:String{
    case update = "eventUpdate"
}
extension Event{
    func assert(_ type:EventType) -> Bool{
        return self.type == type.rawValue
    }
}

