import Foundation

protocol IEventSender {
    var event: ((event:Event) -> ())?{get set}
    func onEvent(event:Event)
}
