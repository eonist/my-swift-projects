import Foundation

protocol IEventSender:class {
    var event: ((Event) -> ())?{get set}//maybe rename to eventRelay?
    func onEvent(event:Event)
}
