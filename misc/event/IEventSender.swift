import Foundation

protocol IEventSender {
    var event: ((event:Event) -> ())?
    func onEvent(event:Event)
}
