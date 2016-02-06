import Foundation

protocol IEventSender {
    var event: ((_ event:Event) -> ())?{get set}
    func onEvent(event:Event)
}
